<%--
  Created by IntelliJ IDEA.
  User: james.toddington
  Date: 21/02/2017
  Time: 11:23
--%>

<%@ page import="uk.gov.ofwat.companysharing.collection.DataBundle" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
<h1>Pass the data bundle</h1>
<g:form action="createDataInput">
    <g:hiddenField name="dataBundleId" value="${uk.gov.ofwat.companysharing.collection.DataBundle.first().id}"></g:hiddenField>
    <g:submitButton name="submit"></g:submitButton>
</g:form>
<body>
Index!
</body>
</html>