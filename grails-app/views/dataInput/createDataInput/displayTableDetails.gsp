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
    <title>Display Table Details</title>
    <asset:javascript src="companySharingInternal/companySharingInternal.js"></asset:javascript>
</head>
<body>
<content tag="title">Display Table Details</content>
<content tag="panel-title">Display Table Details</content>
<content tag="main-page-area">
        <g:form class="form-horizontal form-label-left">
            <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for=""></label>
                <div class="col-md-9 col-sm-9 col-xs-12">
                    Display the details for the TB on this page
                </div>
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for=""></label>
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <g:submitButton class="btn" name="save" value="Save"></g:submitButton>
                    <g:submitButton class="btn" name="cancel" value="Cancel"></g:submitButton>
                    <g:submitButton class="btn" name="back" value="Back"></g:submitButton>
                </div>
            </div>
        </g:form>
</content>
</body>
</html>