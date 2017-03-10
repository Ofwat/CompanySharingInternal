<%--
  Created by IntelliJ IDEA.
  User: james.toddington
  Date: 06/03/2017
  Time: 09:55
--%>
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
    <style type="text/css">
        .ht_master .wtHolder {
            overflow: auto;
            height: 300px !important;
        }
    </style>
</head>
<body>
<content tag="title">Choose a Table Suite</content>
<content tag="panel-title">Choose a Table Suite</content>
<content tag="main-page-area">
    <dataInputTagLib:renderWizardBar stepId="5" wizardSteps="${wizardSteps}">
        <div class="row">
            <div class="col-md-12">
                <h1>*** Placeholder Table ***</h1>
                <g:render plugin="mock-table-plugin" template="/mocktable/mockTable" model="['companyPageInstanceId':companyPageInstanceId, 'showCompanySelect':true]"/>
            </div>
        </div>
        <div class="ln_solid"></div>
        <g:form class="form-horizontal form-label-left">
            <input type="hidden" name="dataBundleId" value="${dataBundleId}"/>
            <div class="form-group">
                <div class="col-md-3 col-sm-3 col-xs-12">
                </div>
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <g:submitButton class="btn btn-success" name="finish" value="Finish"></g:submitButton>
                </div>
            </div>
        </g:form>
    </dataInputTagLib:renderWizardBar>
</content>
</body>
</html>