package companysharinginternal

import uk.gov.ofwat.companysharing.CompanyBundleService
import uk.gov.ofwat.companysharing.CompanyPageInstanceService
import uk.gov.ofwat.companysharing.DataBundleService
import uk.gov.ofwat.companysharing.DataInputService
import uk.gov.ofwat.companysharing.collection.CompanyBundle
import uk.gov.ofwat.companysharing.collection.DataBundle
import uk.gov.ofwat.companysharing.collection.inputs.CompanyDataInput
import uk.gov.ofwat.companysharing.collection.inputs.DataInput
import uk.gov.ofwat.companysharing.collection.inputs.DataInputType
import uk.gov.ofwat.companysharing.collection.inputs.types.TableDataInput
import uk.gov.ofwat.companysharing.company.Company
import uk.gov.ofwat.companysharing.data.CompanyPageInstance
import uk.gov.ofwat.modelbuilder.table.Model
import uk.gov.ofwat.modelbuilder.table.Page

class DataInputController {

    DataInputService dataInputService
    CompanyBundleService companyBundleService
    DataBundleService dataBundleService
    CompanyPageInstanceService companyPageInstanceService

    ArrayList WIZARD_STEPS = [
            [id:"1", shortDesc:"Select Type", longDesc:"Select what type of data you want to collect"],
            [id:"2", shortDesc:"Select Model", longDesc:"Step the Model containing the Table you want to collect"],
            [id:"3", shortDesc:"Select Table", longDesc:"Select the Table you want to collect"],
            [id:"4", shortDesc:"Extra Details", longDesc:"Give this collection a name"],
            [id:"5", shortDesc:"Edit Table", longDesc:"Customise the Table"],
            [id:"6", shortDesc:"Review", longDesc:"Review and save the new input"]
    ]

    def index() { }

    def createDataInputFlow = {
        start{
            action{
                def dataBundleId = params.dataBundleId
                println dataBundleId
                if(params.dataBundleId == null){
                    throw new Exception("Couldn't find a valid data bundle!")
                }
                flow.dataBundleId = dataBundleId
                session.dataBundleId = dataBundleId
                flow.dataBundle = DataBundle.get(dataBundleId)
                def types = DataInputType.list()
                //define the redirectURl
                String redirectUrl = "http://localhost:8080/CompanySharingInternal/dataBundle/show/${dataBundleId}/"
                redirectUrl = redirectUrl.encodeAsURL()
                flow.redirectUrl = redirectUrl

                flow.wizardSteps = this.WIZARD_STEPS
                [dataInputTypes:types, dataBundle:flow.dataBundle]
            }
            on("success").to "selectDataInputType"
            on(Exception).to "handleError"
        }
        selectDataInputType{
            on("fileDataInput").to "displayDataBundle"
            on("formDataInput").to "displayDataBundle"
            on("tableDataInput").to "listModels"
            on("cancel").to "displayDataBundle"
        }
        displayDataCollections{
            redirect (controller:'dataCollection', action:'index')
        }
        displayDataBundle{
            /*
            action {
                def dataBundleId
                if (params.dataBundleId) {
                    dataBundleId = params.dataBundleId
                } else {
                    dataBundleId = flow.dataBundleId
                }
                redirect(controller: 'dataBundle', action: 'show', id: dataBundleId)
            }
            */
            //redirect(controller: 'dataBundle', action: 'show', id: session.dataBundleId)
            redirect(controller: 'dataBundle', action: 'show', params:[id:flow.dataBundleId])
        }
        listModels{
            action{
                [models:Model.list()]
            }
            on("success").to "showModels"
            on(Exception).to "handleError"
        }
        showModels{
            on("select").to "selectModel"
            on("back").to "start"
            on("cancel").to "displayDataBundle"
        }
        selectModel{
            action{
                def model = Model.get(params.modelId)
                flow.model = model
            }
            on("success").to "listTables"
            on(Exception).to "handleError"
        }
        listTables{
            action{
                //Return tables. This is a list of all the pages we have? - will be for the time being!
                [pages:flow.model.pages]
            }
            on("success").to "showTables"
            on(Exception).to "handleError"
        }
        showTables{
            on("select").to "selectTable"
            on("back").to "showModels"
            on("cancel").to "displayDataCollections"
        }
        selectTable{
            action{
                def page = Page.get(params.page)
                flow.page = page
                [companies:Company.list()]
            }
            on("success").to "enterDetails"
            on(Exception).to "handleError"
        }
        enterDetails{
            on("save").to "saveTableDataInput"
            on("back").to "showTables"
            on("cancel").to "displayDataBundle"
        }
        saveTableDataInput{
            action{
                def name = params.name
                def title = params.title
                def companyIntro = params.companyIntro

                def companyIds = params.list("companies")
                def companies = []
                def dataBundle = DataBundle.get(flow.dataBundleId)
                companyIds.each{
                    companies.add(Company.get(it))
                }
                DataInput tableDataInput = dataInputService.createNewTableDataInput(name, companies, flow.page, title, companyIntro)
                dataBundle.addToDataInputs(tableDataInput)
                //Find the companyBundle or create if there isn't one!
                companies.each{ company ->
                    //Company company, DataBundle dataBundle, CompanyDataInput companyDataInput
                    //dataBundleService.createCompanyBundle(dataBundle, company)
                    //TODO There is some kind of issue here with not creating the
                    //company bundle for the last company passed?!!!
                    CompanyBundle cb = dataBundleService.findOrCreateCompanyBundle(dataBundle, company)
                    cb.addToDataInputs(tableDataInput)
                    cb.save()
                    dataBundle.addToCompanies(company)
                }
                dataBundle.save()

                /*
                Get some data to show
                 */
                //flow.dataInput = tableDataInput
                //flow.redirectUrl = "http://localhost:4200?modelId=" + flow.model.id.value + "&tableId=" + flow.page.id.value + "&redirectUrl=" + flow.redirectUrl.value
                TableDataInput tdi = (TableDataInput)tableDataInput.companyDataInput.first()
                CompanyPageInstance selectedCompanyPageInstance = tdi.companyPageInstance//companyPageInstanceService.findForCompanyAndTableDataInput(companies.first(), tableDataInput)
                flow.companyPageInstance = selectedCompanyPageInstance
                flow.dataBundleId = dataBundle.id
                [dataInputId:tableDataInput.id, companyPageInstanceId:selectedCompanyPageInstance.id]
            }
            //on("success").to "displayDataBundle"
            //on("success").to "displayTable"
            on("success").to "editTable"
            on(Exception).to "handleError"
        }
        displayTableDetails{
            on("save").to "saveTable"
            on("back").to "enterDetails"
            on("cancel").to "displayDataBundle"
        }
        saveTable{
            action{
                //DO the final persist here.
                println "In the save table action."
            }
            on("success").to "showSuccessSummary"
            on(Exception).to "handleError"
        }
        editTable{
            on("finish").to "finish"
        }
        finish(){
            [ dataBundleId: session.dataBundleId, wizardSteps:WIZARD_STEPS ]
        }
        /*
        displayTable(){
            redirect (url:flow.redirectUrl)
        }
        */
        showSuccessSummary()
        handleError{

        }
    }

    def viewTable(params){
        def companyPageInstance = CompanyPageInstance.get(1)
        [companyPageInstance:companyPageInstance]
    }

    def showTableDataInput(params){
        DataInput dataInput = DataInput.get(params.dataInputId)
        DataBundle dataBundle = DataBundle.get(params.dataBundleId)
        Set<CompanyDataInput> companyDataInputs = dataInput.companyDataInput
		
		
        TableDataInput tdi = (TableDataInput)companyDataInputs.first()
        def cpi = tdi.companyPageInstance
        
		//CompanyBundle cb = companyBundleService.getCompanyBundleForDataInputAndCompany(dataInput, companyDataInputs.first().company)
        [companyPageInstanceId:cpi.id, dataInputId:dataInput.id, dataBundle:dataBundle, dataInput:dataInput]
    }
}
