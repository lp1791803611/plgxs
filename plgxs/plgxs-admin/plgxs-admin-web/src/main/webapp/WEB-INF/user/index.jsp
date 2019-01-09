<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/31
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>用户管理</title>
    <!-- bootstrap.css-->
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath }/static/js/bootstrap/css/bootstrap.css">
    <!-- bootstrap-table.css -->
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath }/static/js/bootstrap/bootstrap-table/bootstrap-table.css">
    <!-- jquery-3.3.1.js -->
    <script src="${contextPath }/static/js/jquery-3.3.1.js"></script>
    <!-- bootstrap.js -->
    <script src="${contextPath }/static/js/bootstrap/js/bootstrap.js"></script>
    <!-- bootstrap-table.js -->
    <script src="${contextPath}/static/js/bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <!-- bootstrap-table-zh-CN.js -->
    <script src="${contextPath}/static/js/bootstrap/bootstrap-table/bootstrap-table-zh-CN.js"></script>
</head>
<body>
    <span>用户管理</span>
    <span>${contextPath}</span>
</body>
</html>
