package companysharinginternal

class DataInputTagLib {
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "dataInputTagLib"

    def renderWizardBar = { attrs, body ->
        def height = attrs.height ? attrs.height : ""
        def step = attrs.stepId
        def wizardSteps = attrs.wizardSteps //[[id: "id", smallDesc:"", longDesc:""]]

        def result = """<div id="wizard" class="form_wizard wizard_horizontal">
        <ul class="wizard_steps anchor">"""

        def headerStr = ""
        def bodyStr = ""

        wizardSteps.eachWithIndex{ wizardStep, index ->
            def selected = (wizardStep.id == step) ? "selected" : ""
            def header = """
                <li>
                    <a href="#${wizardStep.id}" class="${selected}" isdone="1" rel="${index}">
                        <span class="step_no">${index+1}</span>
                        <span class="step_descr">
                            ${wizardStep.shortDesc}<br>
                            <small>${wizardStep.longDesc}</small>
                        </span>
                    </a>
                </li>
            """
            headerStr = "${headerStr}${header}"
        }

        result = "${result}${headerStr}</ul>"
        result = """${result}
        <div class="stepContainer" style="height: ${height}px; overflow-y: hidden;">
        <div id="${step}" class="content" style="display: block;">
        ${body()}
        </div>
        </div>
        </div>
        """

        out << result
    }



}
