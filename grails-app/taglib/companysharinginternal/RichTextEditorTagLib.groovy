package companysharinginternal

class RichTextEditorTagLib {
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "editor"

    def renderEditor = { attrs, body ->
        def result = "<div id='hiddenToolbar' style='visibility: hidden'></div>"
        def edit = attrs.edit ? true : false
        def id = attrs.id
        def name = attrs.name
        def placeholder = attrs.placeholder
        def value = attrs.value ? attrs.value : ""

        def hideToolbarStr = ""
        def jsBody = ""
        if(edit == false){
            hideToolbarStr = "toolbar='hiddenToolbar'"
            jsBody = """
   \$(document).ready(function(){
        document.querySelector('trix-editor').contentEditable = false
    });
"""
        }

        result = result + """<input type="hidden" name="${name}" id="${id}" value='${value}' class="" placeholder="${placeholder}"></input>"""
        result = result + """<trix-editor ${hideToolbarStr} input="${id}"></trix-editor>"""
        asset.script(){jsBody}
        out << result
    }

}
