package companysharinginternal

import grails.converters.JSON
import uk.gov.ofwat.companysharing.DataCollectionService
import uk.gov.ofwat.companysharing.collection.DataCollection
import uk.gov.ofwat.employee.User

class DataCollectionController {

    DataCollectionService dataCollectionService

    /**
     * Show a list of data collections and allow
     */
    def index() {
        def dataCollections = DataCollection.createCriteria().list {
            eq 'completed', false
            order("dateCreated", "desc")
        }
        return [dataCollections:dataCollections]
    }

    /*
     */
    def create(){
        [dataCollection:new DataCollection()]
    }

    /**
     * Save a new data collection - do some validation here too!
     */
    def save(DataCollection dataCollection){
        withForm {
            //TODO This needs to be looked at!
            //WE are always assigning this user!
            dataCollection.createdBy = User.first()
            dataCollection.validate()
            if (dataCollection.hasErrors()) {
                dataCollection.errors.each {
                    log.info(it)
                }
                render view: 'create', model:[dataCollection: dataCollection]
                return
            }else{
                dataCollection = dataCollectionService.createOrUpdateDataCollection(dataCollection)//DataCollection.findOrSaveById(dataCollection.id)
                render model:[dataCollection:dataCollection], view:'show'
            }
        }.invalidToken {
            // bad request

            render view: 'create', bean: dataCollection
            return
        }
    }

    def show(params){
        if(params.id){
            render view:'show', model:[dataCollection: DataCollection.get(params.id)]
            return
        }
        redirect(action:"index")
    }

    def edit(){
        if(params.id){
            render view:'create', model:[dataCollection: DataCollection.get(params.id)]
            return
        }
        redirect(action:"index")
    }
    /*
    Helper method to get
     */
    def getDataCollectionDetails(params){
        DataCollection dataCollection = DataCollection.get(params.id)
        if(DataCollection != null){
            render model:[dataCollection:dataCollection, edit:false], template: 'show'
        }
    }

    def copy(params){
        def dataCollections = DataCollection.createCriteria().list {
            //eq 'completed', false
            order("dateCreated", "desc")
        }
        return [dataCollections:dataCollections]
    }

    def doCopy(params){
        def result = [:]
        DataCollection original = DataCollection.get(params.dataCollectionId)
        if(original != null){
            //Do the copy
            DataCollection copy = dataCollectionService.copyDataCollection(original)
            result = [succcess:true, dataCollectionId:copy.id, dataCollectionName:copy.name, message:"Successfully copied " + original.name + " to collection named " + copy.name]
            render result as JSON
        }else{
            //Send a  500 response
            result = [success:false, message:"Unable to copy data collection " + original?.name]
            response.status = 500
            render result as JSON
        }
    }

}
