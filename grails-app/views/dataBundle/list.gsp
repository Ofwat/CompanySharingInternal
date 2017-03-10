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
    <title>Data Bundles</title>
</head>
<body>
<content tag="title">Data Bundles</content>
<content tag="panel-title">Showing data bundles for collection ${dataCollection.name}</content>
<content tag="main-page-area">

    <row>
        <div class="col-md-12" id="bundleContainer">
            <g:render template="/dataBundle/dataBundleTable" model="[dataCollection:dataCollection, edit:true, id:'tableBundle']"></g:render>
        </div>
    </row>
    <row>
        <form class="form-horizontal form-label-left input_mask">
            <div class="form-group">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                    <a href="${g.createLink(action:'create', params:['id':dataCollection.id])}" name="btnEdit" class="btn btn-success"><i class="fa fa-plus"></i>&nbsp;<i class="fa fa-cubes"></i>&nbsp;Create A New Data Bundle</a>
                    <a href="${g.createLink(action:'show', controller: 'dataCollection', params:['id':dataCollection.id])}" class="btn btn-default">Back To Data Collection</a>
                </div>
            </div>
        </form>
    </row>
</content>
<asset:script>
    $(document).ready(function(){
        //Add event handlers to the
        var updateBundlePublished = function(dataBundleId, collectionId){
            <g:remoteFunction onComplete="postRender()" controller="dataBundle" action="publishUnpublishBundle" update="bundleContainer" params="'dataBundleId='+dataBundleId+'&dataCollectionId='+collectionId"/>
        }
        var addHandlers = function(){
            $(".btnPublish").click(function(evt){
                //alert($(evt.target).data("bundleid")+":"+$(evt.target).data("collectionid"));
                updateBundlePublished($(evt.target).data("bundleid"), $(evt.target).data("collectionid"));
            });
        }
        var postRender = function(){
            $("#tableBundle").DataTable();
            addHandlers();
        }
        postRender();
        addHandlers();
    });
</asset:script>
</body>
<content tag="footScripts">
    <!-- test -->
</content>
</html>