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
    <title>Choose a Model</title>
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
</head>
<body>
<content tag="title">Choose a Table Suite</content>
<content tag="panel-title">Choose a Table Suite</content>
<content tag="main-page-area">
<dataInputTagLib:renderWizardBar stepId="2" wizardSteps="${wizardSteps}">
    <g:form class="form-horizontal form-label-left">
        <g:hiddenField name="dataBundleId" value="${dataBundleId}"></g:hiddenField>
        <div class="form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Select A Table Suite</label>
            <div class="col-md-6 col-sm-6 col-xs-12"><g:select class="form-control" from="${models}" value="${model?.id}" name="modelId" optionValue="name" optionKey="id"></g:select></div>
            <div class="col-md-3 col-sm-3 col-xs-12"></div>
        </div>

        <div class="form-group">
            <div class="col-md-3 col-sm-3 col-xs-12">
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <g:submitButton class="btn btn-success" name="select" value="Select Table Suite"></g:submitButton>
                <g:submitButton class="btn" name="cancel" value="Cancel"></g:submitButton>
                <g:submitButton class="btn btn-default" name="back" value="Back"></g:submitButton>
            </div>
        </div>
    </g:form>
</dataInputTagLib:renderWizardBar>
</content>
</body>
</html>