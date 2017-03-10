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
    <title>Data Collections</title>
</head>
<body>
<content tag="title">Data Collections</content>
<content tag="panel-title">Showing data collection ${dataCollection.name}</content>
<content tag="main-page-area">
    <row>
        <form class="form-horizontal form-label-left input_mask">
            <g:render template="form" bean="${dataCollection}" model="${[edit:false]}"></g:render>
            <div class="form-group">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                    <a href="${g.createLink(action:'edit', params:['id':dataCollection.id])}" name="btnEdit" class="btn btn-success">Edit Data Collection Details</a>
                    <a href="${g.createLink(controller:'dataBundle', action:'list', params:['dataCollectionId':dataCollection.id])}" name="btnBundles" class="btn btn-default"><i class="fa fa-plus"></i>&nbsp;Add/Edit Data Bundles</a>
                    <a href="${g.createLink(controller:'dataCollection', action:'index')}" class="btn btn-default">Back To Collections</a>
                </div>
            </div>
        </form>
    </row>
    <!--
    <row>
        <g:render template="/dataBundle/dataBundleTable" model="[dataCollection:dataCollection]"></g:render>
    </row>
    -->
</content>
<asset:script>
    $(document).ready(function(){

    });
</asset:script>
<asset:javascript src="dataCollection.js"></asset:javascript>
</body>
<content tag="footScripts">
    <!-- test -->
</content>
</html>