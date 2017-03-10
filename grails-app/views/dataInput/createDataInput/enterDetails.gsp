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
    <title>Enter Input Details</title>
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
</head>
<body>
<content tag="title">Enter Input Details</content>
<content tag="panel-title">Enter the details for this data input:</content>
<content tag="main-page-area">
<dataInputTagLib:renderWizardBar stepId="4" wizardSteps="${wizardSteps}">

    <g:form class="form-horizontal form-label-left">
        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Enter a name for this input</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <g:textField class="form-control" name="name" value="Input based on model ${model.name}, page ${page.name}"></g:textField>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12"></div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Enter a title for the display of this input</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <g:textField class="form-control" name="title" value="" placeholder="User display title"></g:textField>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12"></div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Enter a description displayed to users for this input</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <editor:renderEditor placeholder="companyIntro" value="" name="companyIntro" id="companyIntro" edit="${true}"></editor:renderEditor>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12"></div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select the companies for this input:</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <dataBundleTagLib:companyBundleSelect dataBundle="${dataBundle}" id="companies" edit="${true}"/>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12"></div>
        </div>
        <div class="form-group">
            <div class="col-md-3 col-sm-3 col-xs-12"></div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <g:submitButton class="btn btn-success" name="save" value="Edit Table"></g:submitButton>
                <g:submitButton class="btn" name="cancel" value="cancel"></g:submitButton>
                <g:submitButton class="btn" name="back" value="back"></g:submitButton>
            </div>
        </div>

    </g:form>
</dataInputTagLib:renderWizardBar>
</content>
<asset:script>
    $(document).ready(function(){
        $("#companies").select2();
    });
</asset:script>
</body>
</html>