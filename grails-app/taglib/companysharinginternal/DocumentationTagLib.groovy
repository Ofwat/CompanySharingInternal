package companysharinginternal

import uk.gov.ofwat.companysharing.collection.Documentation.Documentation

class DocumentationTagLib {
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "documentationTagLib"

    def renderDocuments = { attrs, body ->
        Documentation documentation = attrs.documentation
        def result = "<table class='table table-condensed'><thead><th>Name</th><th>Notes</th></thead><tbody>"
        documentation?.documents.each{ doc ->
            result = result + "<tr><td>${doc.name}</td><td>${doc.notes.take(50)}</td></tr>"
        }
        result = result + "</tbody></table>"
        out << result
    }

    def addDocuments = { attrs, body ->
        def documentable = attrs.documentable
        def result = ""
        if(documentable != null){
            result = result + "<a class='addDocument' data-class='${documentable.class}' data-documentableid='${documentable.id}' href='#'>Add Document</a>"
        }

        def modal = """
    <div id="modalAddDocs" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Add document to ${documentable?.name}</h4>
                </div>
                <div class="modal-body">
                    <h4>Add documents:</h4>
                    <form data-parsley-validate="" useToken="true" action="save" controller="documentation" class="form-horizontal form-label-left input_mask">
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name * </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <input type="text" class="form-control" name="name" placeholder="Document Name"></input>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Notes * </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <textArea class="form-control" name="notes" placeholder="Notes"></textArea>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Choose File * </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <input type="file" name="file"></input>
    </div>
</div>
                    </form>                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Upload</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>    
"""

        def js = """
\$(document).ready(function(){
    \$(".addDocument").click(function(event){
        //Show the modal
        event.preventDefault();
        \$('#modalAddDocs').modal('show');
    });    
})
"""
        js = asset.script({js})

        out << js + modal + result
    }

}
