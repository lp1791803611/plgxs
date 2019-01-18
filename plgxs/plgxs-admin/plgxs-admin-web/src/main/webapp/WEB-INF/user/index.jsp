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
        <table id="mytab" class="table table-bordered table-nowrap table-hover table-striped"></table>
    </div>
    <!-- foot -->
    <%@include file="../foot.jsp"%>
</div>
<!-- 引入公共js -->
<%@include file="../javascript.jsp"%>

</body>
</html>
