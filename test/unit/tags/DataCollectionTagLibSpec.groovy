package tags

import companysharinginternal.DataCollectionTagLib
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import uk.gov.ofwat.companysharing.collection.DataCollection
import uk.gov.ofwat.employee.User

/**
 * Created by james.toddington on 09/02/2017.
 */
@TestFor(DataCollectionTagLib)
@Mock([DataCollection, User])
class DataCollectionTagLibSpec extends Specification {

    private testDataCollections(Integer count){
        def dataCollections = []
        (1..count){
            def name = "DataCollection_${it}"
            def user = new User(username: "User_${it}", password: "password")
            DataCollection dc = new DataCollection(createdBy: user, owner:user, name:name,
                    dateCreated: new Date(), completionDate: new Date()+180)
            dataCollections.add(dc)
        }
        return dataCollections
    }

    /**
     * We are skiping testing the tagLibs for the time being as we don't know what they are going to render and
     * also not sure of the value of testing taglibs with simple view rendering.
     */
    /*
    void "test we can display a DataCollection"(){
        def expectedResult = """
            <ul><li></li></ul>
        """
        def dataCollections = testDataCollections(10)
        applyTemplate('<dataCollection:renderCollections dataCollections="${dataCollections}" />', [dataCollections: dataCollections]) == expectedResult
    }
    */
}
