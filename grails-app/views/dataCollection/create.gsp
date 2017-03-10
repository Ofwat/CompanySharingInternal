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
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
</head>
<body>
<content tag="title">Data Collections</content>
<content tag="panel-title">Create a data collection</content>
<content tag="main-page-area">
    <div class="errors">
        <g:renderErrors bean="${dataCollection}" />
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
        <g:form name="createDataCollection" data-parsley-validate="" useToken="true" action="save" controller="dataCollection" class="form-horizontal form-label-left input_mask">
        <g:render template="form" bean="${dataCollection}" model="${[edit:true]}"></g:render>
        <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                <g:submitButton name="submit" type="submit" class="btn btn-success"></g:submitButton>
                <a href="<g:createLink action="show" controller="dataCollection" id="${dataCollection?.id}"></g:createLink>" class="btn btn-default">Cancel</a>
            </div>
        </div>
        </g:form>
    </row>
</content>
<asset:script>
    $(document).ready(function(){

        $('#createDataCollection').parsley().on('field:validated', function() {
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