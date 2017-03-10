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
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
</head>
<body>
<g:set var="dataBundle" value="${dataBundle}"/>
<content tag="title">Data Bundles</content>
<content tag="panel-title">Create a new data bundle for collection ${dataCollection.name}</content>
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
        <g:form name="createDataBundle" useToken="true" action="save" controller="dataBundle" class="form-horizontal form-label-left input_mask">
            <g:render template="form" bean="${dataBundle}" model="${[edit:true]}"></g:render>
            <g:textField name="dataCollectionId" hidden="true" value="${dataCollection.id}"></g:textField>
            <div class="form-group">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">


                    <a href="<g:createLink controller="dataBundle" action="list" params="[dataCollectionId:dataCollection.id]"></g:createLink>" class="btn btn-primary" type="button">Cancel</a>

                    <g:submitButton name="go" value="Create" class="btn btn-success"></g:submitButton>
                </div>
            </div>
        </g:form>
    </row>
</content>
<asset:script>
    $(document).ready(function(){
        $('#createDataBundle').parsley({excluded: "input[type=button], input[type=url], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"}).on('field:validated', function() {
            var ok = $('.parsley-error').length === 0;
            //$('.bs-callout-info').toggleClass('hidden', !ok);
            //$('.bs-callout-warning').toggleClass('hidden', ok);
        })
        .on('form:submit', function() {
            console.log("Validating Form");
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