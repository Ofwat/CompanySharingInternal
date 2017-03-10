import uk.gov.ofwat.companysharing.DataBundleService
import uk.gov.ofwat.companysharing.DataCollectionService
import uk.gov.ofwat.companysharing.ModelService
import uk.gov.ofwat.companysharing.PageService
import uk.gov.ofwat.companysharing.SectionService
import uk.gov.ofwat.companysharing.Validation.CustomValidator
import uk.gov.ofwat.companysharing.collection.CompanyBundle
import uk.gov.ofwat.companysharing.collection.DataCollection
import uk.gov.ofwat.companysharing.collection.inputs.DataInputType
import uk.gov.ofwat.companysharing.company.Company
import uk.gov.ofwat.companysharing.company.CompanyType
import uk.gov.ofwat.employee.Role
import uk.gov.ofwat.employee.User
import uk.gov.ofwat.employee.UserRole
import uk.gov.ofwat.modelbuilder.table.Cell
import uk.gov.ofwat.modelbuilder.table.CellType
import uk.gov.ofwat.modelbuilder.table.Column
import uk.gov.ofwat.modelbuilder.table.GroupType
import uk.gov.ofwat.modelbuilder.table.Model
import uk.gov.ofwat.modelbuilder.table.ModelDisplayType
import uk.gov.ofwat.modelbuilder.table.Page
import uk.gov.ofwat.modelbuilder.table.PageDetails
import uk.gov.ofwat.modelbuilder.table.Row
import uk.gov.ofwat.modelbuilder.table.Section
import uk.gov.ofwat.modelbuilder.table.SectionDetails
import uk.gov.ofwat.modelbuilder.table.SectionType

class BootStrap {

    ModelService modelService
    PageService pageService
    SectionService sectionService
    DataCollectionService dataCollectionService
    DataBundleService dataBundleService

    def init = { servletContext ->
        //Create required deps
        //def user = User.findOrCreateByUsernameAndPassword("Test User", "password")
        //user.save(flush: true)

        def roleAdmin
        roleAdmin = Role.findByAuthority('ROLE_ADMIN')
        if(roleAdmin == null) {
            roleAdmin = new Role('ROLE_ADMIN')
            roleAdmin.save(flush:true)
        }
        def user = User.findByUsername('admin')
        if(user == null) {
            user = new User('admin', 'admin').save(flush: true)
        }
        def userRole
        userRole = new UserRole(user, roleAdmin).save(flush:true)


        def companyType = new CompanyType(type: CompanyType.COMPANY_TYPES.WATER_ONLY).save(flush: true)
        def cellType = new CellType(type: CellType.CELL_TYPES.INPUT).save(flush: true)
        def sectionType = new SectionType(type: SectionType.SECTION_TYPE.TEST_SECTION_TYPE).save(flush: true)
        def groupType = new GroupType(type: GroupType.GROUP_TYPES.TEST_GROUP_TYPE).save(flush: true)
        def modelDisplayType = new ModelDisplayType(type: ModelDisplayType.DISPLAY_TYPE.COMPANY_SHARING_DESIGN).save(flush: true)
        CustomValidator validator = new CustomValidator(validationPattern: "XXXX", name: "Test Val", description: "Test Desc").save(flush: true)

        def tableDI = new DataInputType(type:DataInputType.DISPLAY_TYPE.TABLE_DATA_INPUT, displayName: DataInputType.NAMES.get(DataInputType.DISPLAY_TYPE.TABLE_DATA_INPUT)).save(flush:true)
        def formDI = new DataInputType(type:DataInputType.DISPLAY_TYPE.FORM_DATA_INPUT, displayName: DataInputType.NAMES.get(DataInputType.DISPLAY_TYPE.FORM_DATA_INPUT)).save(flush:true)
        def fileDI = new DataInputType(type:DataInputType.DISPLAY_TYPE.FILE_DATA_INPUT, displayName: DataInputType.NAMES.get(DataInputType.DISPLAY_TYPE.FILE_DATA_INPUT)).save(flush:true)

        //Create a sample model
        Model model2 = modelService.createModel("APR 2018", modelDisplayType)
        ['Income Statment', 'Totex Analysis', 'Outcome Performance Table'].each {
            //['Income Statment', 'Totex Analysis', 'Outcome Performance Table']
            Page page = pageService.createPage("${it}", "code_${it}", "description_${it}", "text_${it}", "heading_${it}")
            //create some sections
            (1..5).each { sectionCount ->
                def rows = []
                def cols = []
                (1..10).each { rowColCount ->
                    cols.add("Col_${rowColCount}")
                    rows.add("Row_${rowColCount}")
                }
                SectionDetails sectionDetails = sectionService.createSectionDetails(groupType, sectionType, "CODE_SECTION_${sectionCount}")
                Section section = sectionService.createSection(sectionDetails, page, rows, cols)
            }
            model2.addToPages(page)
        }
        model2.save(flush: true)

        //Create some companies.
        def companies = ["Wallace", "Gromit", "Affinity Water", "Southern Water", "Wessex Water", "Dee Valley Water"] //2WASCS 2WOCS
        companies.each{ it ->
            def company = new Company(name:it, companyType:companyType).save(flush:true)
        }

        //Create some sample data collections and add some bundles.
        def collectionNames = ['Annual Collection 2017', 'PR19']
        collectionNames.eachWithIndex { cn, it ->
            //July collection in 2018 consisting of APR and Cost Assessment data tables
            //Business plan submissions for PR19.
            def collectionName = cn//"${it}_COLLECTION_${it}"
            if(DataCollection.findByName(collectionName) == null){
                DataCollection dataCollection = dataCollectionService.createDataCollection(collectionName, user, user, new Date() + it, "DESCRIPTION_${it}")
                //dataCollection.save(flush:true)
                if(dataCollection != null) {
                    (1..5).each { bc ->
                        def bundleName = "${collectionName}_BUNDLE_${bc}"
                        def bundle = dataBundleService.createDataBundle(bundleName, user, user, dataCollection, )
                        bundle.save(flush: true)
                        Company.list().each { company ->
                            //CompanyBundle cb = new CompanyBundle(company: company, dataBundle: bundle, dateCreated: new Date())
                            //cb.save(flush: true, failOnError: true)
                            //bundle.addToCompanyBundles(cb)
                            CompanyBundle cb = dataBundleService.createCompanyBundle(bundle, company)
                            bundle.addToCompanies(company)
                        }
                        bundle.save(flush: true)
                        //TODO this should be done as part of the DataBundle creation.
                        //dataBundleService.createCompanyBundlesForDataBundle(bundle, bundle.companies)
                    }
                }
            }
        }



        /*
        Model model = new Model(name:"Model 1", modelDisplayType:modelDisplayType).save(flush:true)
        (1..5).each{
            PageDetails pd = new PageDetails(
                    code: "${it}a",
                    description: "a description",
                    text: "some text",
                    companyType: companyType,
                    heading: "heading${it}",
                    commercialInConfidence: false,
                    nce: "NCE?",
                    hidden: false,
                    textCode: "textCode"
            )
            Page page = new Page(pageDetails: pd, name: "Page${it}")
            page.save(flush: true)
            model.addToPages(page)
        }
        Page page = Page.get(1)

        //Create some sections
        (1..5).each { it ->
            SectionDetails sd = new SectionDetails(
                    code: "Code${it}",
                    display: true,
                    groupType:groupType,
                    useLineNumber: true,
                    useItemCode: true,
                    useItemDescription: true,
                    useUnit: true,
                    useYearCode: true,
                    useConfidenceGrades: true,
                    allowGroupSelection: true,
                    sectionType:sectionType
            )
            Section section = new Section(sectionDetails: sd, page:page)
            section.save(flush: true)
        }

        //Create some rows and columns
        (1..25).each{
            Row row = new Row(rowNumber: it, page:page).save(flush:true)
            Column col = new Column(columnNumber: it, page:page).save(flush:true)
        }

        //Create some cells
        def rowCount = 1
        def colCount = 1
        def sectionCount = 1
        def selectedSection = Section.get(sectionCount)
        def row = Row.get(rowCount)
        def col = Column.get(colCount)
        selectedSection.addToRows(row)
        selectedSection.addToColumns(col)
        println "Populating from row and col ${rowCount}:${colCount} in section ${selectedSection.sectionDetails.code}."
        def totalCells = 25*25 //Total number of cells in our 25*25 table
        (1..(totalCells-1)).each{
            if(it%25 == 0){
                rowCount++
                row = Row.get(rowCount)
                selectedSection.addToRows(row)
            }
            if(it%25 == 0){
                colCount=1
                col = Column.get(colCount)
                selectedSection.addToColumns(col)
            }
            if(it%125 == 0){
                selectedSection = Section.get(++sectionCount)
                println "Populating from row and col ${rowCount}:${colCount} in section ${selectedSection.sectionDetails.code}."
            }
            Cell cell = new Cell(
                    cellType: cellType,
                    validator: validator,
                    content: "Sample content ${it}",
                    row:row,
                    startColumn: col,
                    section: selectedSection,
                    span: 1
            ).save(flush:true, failOnError: true)
            row.addToCells(cell)
            col.addToCells(cell)
            row.save(flush:true)
            col.save(flush:true)
            colCount++
        }

        //Save the model
        model.save(flush:true)
        */
    }
    def destroy = {
    }
}
