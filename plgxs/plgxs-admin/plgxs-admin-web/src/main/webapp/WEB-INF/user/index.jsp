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
    <link rel="icon" href="${contextPath}/images/favicon.ico">
    <title>用户管理</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Heade Navbar, Control Sidebar-->
    <%@include file="../head.jsp"%>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="../left.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <span>用户管理</span>
        <span>${contextPath}</span>
    </div>
    <!-- foot -->
    <%@include file="../foot.jsp"%>
</div>
</body>
</html>
