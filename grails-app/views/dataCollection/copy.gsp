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
<content tag="title">Copy Data Collection</content>
<content tag="panel-title">Copy a data collection</content>
<content tag="main-page-area">
    <row>
        <form class="form-horizontal form-label-left">
            <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">Select a Collection:</label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <dataCollectionTagLib:renderCollectionsSelect dataCollections="${dataCollections}"></dataCollectionTagLib:renderCollectionsSelect>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <a href="#" id="btnCopyDataCollection" class="btn btn-primary">Copy Data Collection</a>
                </div>
            </div>
        </form>
    </row>
    <row>
        <g:form class="form-horizontal form-label-left input_mask">
            <div class="col-md-12" class="dataCollectionDetails" id="dataCollectionDetails"></div>
        </g:form>
    </row>
</content>
<asset:script>
    $(document).ready(function(){
        var jqxhr = function(dataCollectionId){
            $.ajax({
                url:"<g:createLink action="doCopy" controller="dataCollection"/>",
                data:{dataCollectionId:dataCollectionId}
                })
                .done(function(result) {
                  showSuccessMessage("Copied Data Bundle", result.message);
                })
                .fail(function(result) {
                  showErrorMessage("Could't copy data collection.", result.message);
            });
        };
        $("#btnCopyDataCollection").click(function(e){
            //Make an ajax request to copy the data collection
            var dataCollectionId = $(".dataCollectionSelect").val();
            jqxhr(dataCollectionId);
        });
            /*
            var url = "<g:createLink controller="dataCollection" action="doCopy"></g:createLink>";
                url = url + "?id=" + $(".dataCollectionSelect").val();
                window.location.href = url;
            });
            */
            var getDataCollectionDetails = function(dataCollectionId) {
    <g:remoteFunction controller="dataCollection"
                      action="getDataCollectionDetails"
                      params="'id=' + dataCollectionId"
                      update="dataCollectionDetails"
                      onFailure="showErrorMessage()"
                      onComplete="dataCollectionFeature.createDatePickers()"></g:remoteFunction>
    }
    $(".dataCollectionSelect").on("select2:select", function (e){
        getDataCollectionDetails(e.params.data.id);
    });
    getDataCollectionDetails($(".dataCollectionSelect").val());
});
</asset:script>
</body>
</html>