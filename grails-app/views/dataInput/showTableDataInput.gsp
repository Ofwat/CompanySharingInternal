
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="defaultPage"/>
    <title>View Data Input</title>
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
    <style type="text/css">
    .ht_master .wtHolder {
        overflow: auto;
        height: 300px !important;
    }
    </style>
</head>
<body>
<content tag="title">Data Input</content>
<content tag="panel-title">${dataInput.name}</content>
<content tag="main-page-area">
        <div class="row">
            <div class="col-md-12">
                <g:render plugin="mock-table-plugin" template="/mocktable/mockTable" model="['companyPageInstanceId':companyPageInstanceId, 'showCompanySelect':true]"/>
            </div>
        </div>
        <div class="ln_solid"></div>
        <a href="#" class="btn btn-success"><i class="fa fa-cloud-upload"></i>&nbsp;Send To Fountain</a>
        <a href="#" class="btn btn-warning"><i class="fa fa-check"></i>&nbsp;Validate</a>
        <a href="#" class="btn btn-danger"><i class="fa fa-question-circle"></i>&nbsp;Create Query?</a>
        <a href="<g:createLink controller="dataBundle" action="show" id="${dataBundle.id}"></g:createLink>" class="btn btn-default">Back to Data Bundle</a>
</content>
</body>
</html>