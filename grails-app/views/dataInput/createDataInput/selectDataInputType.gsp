<%--
  Created by IntelliJ IDEA.
  User: james.toddington
  Date: 07/02/2017
  Time: 18:20
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="defaultPage"/>
    <title>Select DataInput Type</title>
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
</head>
<body>
<content tag="title">Select DataInput Type</content>
<content tag="panel-title">Select DataInput Type</content>
<content tag="main-page-area">


    <dataInputTagLib:renderWizardBar stepId="1" wizardSteps="${wizardSteps}">
        <div class="row"></div>
        <g:form class="form-horizontal form-label-left">
            <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Select Data Input Type</label>
                <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataCollection,field:'name','errors')}'">
                    <g:each in="${dataInputTypes}" var="type">
                        <g:submitButton data-inputTypeId="${type.id}" class="btn btn-success btn-inputTypeSelect" name="${type.type}" value="${type.displayName}"></g:submitButton>
                    </g:each>
                    <g:submitButton class="btn" name="cancel" value="Cancel"></g:submitButton>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        &nbsp;
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-8" id="inputTypeInfo">
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div id="tableInfo" style="visibility: hidden; display: none">
                    <p class="lead">Table Capture</p>
                    <p>Capture data based on an existing table or report.</p>
                    <div style="border: 1px solid #ddd; border-radius: 4px;">
                        <asset:image src="ExternalTableCapture.png"></asset:image>
                    </div>
                </div>
                <div id="fileInfo" style="visibility: hidden; display: none">
                    <p class="lead">File Capture</p>
                    <p>Let the user upload a file.</p>
                    <div style="border: 1px solid #ddd; border-radius: 4px;">
                        <asset:image src="ExternalFileCapture.png"></asset:image>
                    </div>
                </div>
                <div id="formInfo" style="visibility: hidden; display: none">
                    <p class="lead">Form Capture</p>
                    <p>Build or select a form for the user to complete.</p>
                    <div style="border: 1px solid #ddd; border-radius: 4px;">
                        <asset:image src="ExternalFormCapture.png"></asset:image>
                    </div>
                </div>
            </div>
        </g:form>
    </dataInputTagLib:renderWizardBar>

</content>
</body>
<asset:script>
    $(document).ready(function(){
        var overFunction = function(evt){
            var data = $(evt.target).data("inputtypeid");
            $("#inputTypeInfo").html(data);
            if(data == 1){
                $element = $("#tableInfo")
                $("#inputTypeInfo").html($element.html())
                $element.show('fast')
            }
            if(data == 2){
                $element = $("#formInfo")
                $("#inputTypeInfo").html($element.html())
                $element.show('fast')
            }
            if(data == 3){
                $element = $("#fileInfo")
                $("#inputTypeInfo").html($element.html())
                $element.show('fast')
            }
        };
        var outFunction = function(evt){
            $("#inputTypeInfo").html("");
        }
        $(".btn-inputTypeSelect").hover(overFunction, outFunction);
    });
</asset:script>
</html>