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
    <content tag="panel-title">Select a data collection</content>
    <content tag="main-page-area">
        <row>
            <div class="col-md-4">
                <form class="form-horizontal form-label-left">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-4 col-sm-3 col-xs-12">Select a Collection:</label>
                            <div class="col-md-8 col-sm-6 col-xs-12">
                                <dataCollectionTagLib:renderCollectionsSelect dataCollections="${dataCollections}"></dataCollectionTagLib:renderCollectionsSelect>
                            </div>
                        </div>
                        <div class="row">
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-3 col-xs-12">
                            </div>
                            <div class="col-md-8 col-sm-3 col-xs-12">
                                <a href="#" id="btnSelectDataCollection" class="btn btn-primary">Select</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-8">
                <g:form class="form-horizontal form-label-left input_mask">
                    <div class="col-md-12" class="dataCollectionDetails" id="dataCollectionDetails"></div>
                </g:form>
            </div>
        </row>
    </content>
    <asset:script>
        $(document).ready(function(){
            $("#btnSelectDataCollection").click(function(e){
                var url = "<g:createLink controller="dataCollection" action="show"></g:createLink>";
                url = url + "?id=" + $(".dataCollectionSelect").val();
                window.location.href = url;
            });
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
