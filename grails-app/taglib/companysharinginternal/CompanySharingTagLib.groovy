package companysharinginternal

class CompanySharingTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "companySharingTagLib"
    static String dateFormat = 'dd/MM/yy'

    def formatDate = { attrs, body ->
        if((attrs.date != null) && (attrs.date instanceof Date)){
            if(attrs.format != null){
                out << attrs.date.format(attrs.format)
            }else {
                out << attrs.date.format(dateFormat)
            }
        }
    }
}
