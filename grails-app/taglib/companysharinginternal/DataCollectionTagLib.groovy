package companysharinginternal

import uk.gov.ofwat.companysharing.collection.DataCollection

import java.lang.reflect.Array

class DataCollectionTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static encodeAsForTags = [renderCollections: [taglib:'none']]
    static namespace = "dataCollectionTagLib"

    def renderCollectionsSelect = { attrs, body ->
        ArrayList<DataCollection> dataCollections = attrs.dataCollections
        def op = "<select placeholder='Select a collection' class='dataCollectionSelect form-control'>"
        dataCollections.each{ DataCollection dataCollection ->
            op = "${op}<option value='${dataCollection.id}'>${dataCollection.name}</option>"
        }
        op = "${op}</select>"
        def jsop = asset.script({'''
    $(document).ready(function(){
        $(".dataCollectionSelect").select2();
    });'''})
        out << op + jsop
    }

}
