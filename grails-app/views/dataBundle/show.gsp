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
    <title>Data Bundle</title>
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>

</head>
<body>
<g:set var="dataBundle" value="${dataBundle}"/>
<content tag="title">Data Bundle</content>
<content tag="panel-title">Showing Data Bundle ${dataBundle?.name}</content>
<content tag="main-page-area">
    <div class="errors">
        <g:renderErrors bean="${dataBundle}" />
    </div>
    <g:if test="${flash.invalidToken}">
        Don't click the button twice!
    </g:if>
    <!--
    <div class="bs-callout bs-callout-warning hidden">
        <h4>Oh snap!</h4>
        <p>This form seems to be invalid :(</p>
    </div>
    <div class="bs-callout bs-callout-info hidden">
        <h4>Yay!</h4>
        <p>Everything seems to be ok :)</p>
    </div>
    -->
    <row>
        <g:form name="createDataBundle" data-parsley-validate="" useToken="true" action="save" controller="dataBundle" class="form-horizontal form-label-left input_mask">
            <g:render template="form" bean="${dataBundle}" model="${[edit:edit]}"></g:render>
            <g:textField name="dataCollectionId" hidden="true" value="${dataCollection.id}"></g:textField>
            Collecting the following data for:

            <div id="dataBundleInputs">
                <dataBundleTagLib:renderCollectionsTable dataInputs="${dataBundle.dataInputs}" dataBundle="${dataBundle}"></dataBundleTagLib:renderCollectionsTable>
            </div>

            <div class="form-group">
                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                    <a class="btn btn-primary" href="<g:createLink action='createDataInput' controller='dataInput' params='[dataBundleId:dataBundle.id]'/>"><i class="fa fa-plus"></i>&nbsp;<i class="fa fa-cube"></i>&nbsp;Create New Data Input</a>
                    <dataBundleTagLib:publishUnpublishBundleButton dataBundle="${dataBundle}" id="btnPublish"></dataBundleTagLib:publishUnpublishBundleButton>
                    <a href="<g:createLink action="list" controller="dataBundle" params="['dataCollectionId':dataCollection.id]"></g:createLink>" class="btn btn-default">Back to Data Bundles</a>
                </div>
            </div>
        </g:form>

    %{--<form action="/file-upload"--}%
          %{--class="dropzone"--}%
          %{--id="my-awesome-dropzone"></form>--}%
    </row>


    <!-- Modal to control publication status of a DataBundle and ideally expanded to other publishable! things.  -->
    <div id="modalPublish" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Change Bundle Published State</h4>
                </div>
                <div class="modal-body">
                    <h4>Select companies to change:</h4>
                    <div class="companyPublishSelect">
                            <br/>
                            <g:each in="${dataBundle.companyBundles}" var="companyBundle">
                                <div class="row">
                                    <div class="col-md-3"><h4>${companyBundle.company.name}</h4></div>
                                    <div class="col-md-9"><g:checkBox data-companybundleid="${companyBundle.id}" name="publishedCompanyBundle_${companyBundle.id}" class="js-switch publishCompanyBundle" checked="${companyBundle.published}"></g:checkBox></div>
                                </div>
                                <br/>
                            </g:each>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    %{--<button type="button" class="btn btn-primary">Un-publish</button>--}%
                </div>

            </div>
        </div>
    </div>


</content>
<asset:script>
    $(document).ready(function(){

        var updateUI = function(dataBundleId){
            <g:remoteFunction controller="dataBundle" action="renderBundleUI" update="dataBundleInputs" params="'dataBundleId='+dataBundleId"/>
        }

        var publishUnpublishCompanyBundle = function(companyBundleId, dataBundleId){
            <g:remoteFunction onComplete="updateUI(${dataBundle?.id})" controller="dataBundle" action="publishUnpublishCompanyBundle" params="'companyBundleId='+companyBundleId+'&dataBundleId='+dataBundleId"/>
        }

        $(".publishCompanyBundle").change(function(){
            //Get the companyBundle id
            var companyBundleId = $(event.target).data("companybundleid")
            //make a post to publish/unpublish the bundle
            publishUnpublishCompanyBundle(companyBundleId, 0);
        });

        $("#btnPublish_publish").click(function(event){
            //Show the modal
            event.preventDefault();
            //Render the publish/unpublish select.

            $('#modalPublish').modal('show');
        });
        $('#createDataBundle').parsley().on('field:validated', function() {
            var ok = $('.parsley-error').length === 0;
            //$('.bs-callout-info').toggleClass('hidden', !ok);
            //$('.bs-callout-warning').toggleClass('hidden', ok);
        })
        .on('form:submit', function() {
            var form = $(this);
            form.parsley().validate();
            if (form.parsley().isValid()){
                return true;
            }
            return false; // Don't submit form for this demo
        });
});
</asset:script>
</body>
</html>