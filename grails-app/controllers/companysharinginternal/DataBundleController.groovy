package companysharinginternal

import grails.converters.JSON
import org.fusesource.jansi.AnsiRenderer
import uk.gov.ofwat.companysharing.CompanyBundleService
import uk.gov.ofwat.companysharing.DataBundleService
import uk.gov.ofwat.companysharing.collection.CompanyBundle
import uk.gov.ofwat.companysharing.collection.DataBundle
import uk.gov.ofwat.companysharing.collection.DataCollection
import uk.gov.ofwat.companysharing.company.Company
import uk.gov.ofwat.employee.User

class DataBundleController {

    DataBundleService dataBundleService
    CompanyBundleService companyBundleService

    def index() { }

    def create(params){
        DataCollection dataCollection = DataCollection.get(params.id)
        if(dataCollection != null) {
            DataBundle dataBundle = new DataBundle(dataCollection)
            render view:'create', model:[dataBundle: dataBundle, dataCollection: dataCollection]
            return
        }else{
            //TODO Show error page!
        }
    }

    def edit(params){
        def dataBundle = DataBundle.get(params.id)
        render view:'create', model:[dataBundle: dataBundle, dataCollection: dataBundle.dataCollection]
    }

    def save(params){
        DataBundle dataBundle
        if(params.id == null) {
             dataBundle = new DataBundle()
             //TODO This needs to be looked at!
             dataBundle.createdBy = User.first()
        }else{
            dataBundle = DataBundle.get(params.id)
        }
        DataCollection dataCollection = DataCollection.get(params.dataCollectionId)
        bindData(dataBundle, params)
        withForm {
            dataBundle.dataCollection = dataCollection
            dataBundle.save()
            if (dataBundle.hasErrors()) {
                dataBundle.errors.each {
                    log.info(it)
                }
                render view: 'create', model:[dataBundle: dataBundle, dataCollection: dataCollection]
                return
            }else{
                params.companies.each{
                    Company company = Company.get(it)

                    if(CompanyBundle.findByCompanyAndDataBundle(company, dataBundle) == null) {
                        //Create new company bundle
                        CompanyBundle cb = dataBundleService.createCompanyBundle(dataBundle, company)
                        /*
                        CompanyBundle cb = new CompanyBundle(company: company, dataBundle: dataBundle)
                        cb.save()
                        dataBundle.addToCompanyBundles(cb)
                        */
                    }

                    dataBundle.addToCompanies(company)
                }
                dataBundle = dataBundleService.createOrUpdateDataBundle(dataBundle)
                render model:[dataBundle:dataBundle, dataCollection:dataCollection], view:'show'
            }
        }.invalidToken {
            // bad request
            flash.message = "Problems!"
            render view: 'create', model:[dataBundle:dataBundle, dataCollection:dataCollection]
            return
        }
    }

    def list(params){
        DataCollection dataCollection = DataCollection.get(params.dataCollectionId)
        if(dataCollection){
            render view:'list', model:[dataCollection:dataCollection]
        }else{
            redirect controller: 'DataCollection', action: 'index'
        }
    }

    def show(){
        def dataBundle = DataBundle.get(params.id)
        render view:'show', model:[dataBundle: dataBundle, dataCollection: dataBundle.dataCollection, edit:false]
    }

    def publishUnpublishCompanyBundle(params){
        def result = [:]
        CompanyBundle companyBundle = CompanyBundle.get(params.long("companyBundleId"))
        if(companyBundle != null){
            companyBundle.published = !companyBundle.published
            if(companyBundle.published == true){
                companyBundle.dataBundle.published = true
                companyBundle.dataBundle.save()
            }
            companyBundle.save(flush:true)
        }
        render result as JSON
    }

    def publishUnpublishBundle(params){
        DataBundle dataBundle = DataBundle.get(params.dataBundleId)
        DataCollection dataCollection = DataCollection.get(params.dataCollectionId)
        Boolean publishedState = !dataBundle.published
        dataBundle.companyBundles.each { companyBundle ->
            companyBundle.published = publishedState
            companyBundle.save()
        }
        dataBundle.published = publishedState
        dataBundle.save(flush:true)
        //<g:render template="/dataBundle/dataBundleTable" model="[dataCollection:dataCollection, edit:true, id:'tableBundle']"></g:render>
        render template: "dataBundleTable", model: [dataCollection:dataCollection, edit:true, id:'tableBundle']
    }

    def renderBundleUI(params){
        def dataBundle = DataBundle.get(params.dataBundleId)
        if(dataBundle != null){
            render dataBundleTagLib.renderCollectionsTable(dataInputs: dataBundle.dataInputs, dataBundle: dataBundle)
        }else{
            render ""
        }
    }
    /*
    def renderCompanyBundles(params){
        DataBundle dataBundle = DataBundle.get(params.dataBundleId)
        def companyBundles = []
        dataBundle.dataInputs.each { dataInput ->
            def results = CompanyBundle.createCriteria().list {
                and{
                    eq('dataBundle', dataBundle)
                    //eq('dataInputs', dataBundle.dataInputs)
                    dataInputs{
                        eq('id', dataInput.id)
                    }
                }
            }
            results.each{companyBundles.add(it)}
        }
        companyBundles = companyBundles.unique { companyBundle ->
            companyBundle.id
        }
        render companyBundles as JSON
    }
    */



}
