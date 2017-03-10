<%--
  Created by IntelliJ IDEA.
  User: james.toddington
  Date: 06/03/2017
  Time: 09:55
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="handsontable/dist/handsontable.full.css"></asset:stylesheet>
</head>

<body>
    <g:render plugin="mock-table-plugin" template="/mocktable/mockTable" model="['companyPageInstance':companyPageInstance]"/>
</body>
</html>