<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- jQuery 3 -->
<script src="${contextPath}/assets/vendor_components/jquery-3.3.1/jquery-3.3.1.js"></script>

<!-- jquery validation 1.17.0 -->
<script src="${contextPath}/assets/vendor_components/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
<script src="${contextPath}/assets/vendor_components/jquery-validation-1.17.0/dist/localization/messages_zh.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextPath}/assets/vendor_components/jquery-ui/jquery-ui.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- popper -->
<script src="${contextPath}/assets/vendor_components/popper/dist/popper.min.js"></script>

<!-- date-range-picker -->
<script src="${contextPath}/assets/vendor_components/moment/min/moment.min.js"></script>
<script src="${contextPath}/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Bootstrap 4.0-->
<script src="${contextPath}/assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>

<!-- ChartJS -->
<script src="${contextPath}/assets/vendor_components/chart.js-master/Chart.min.js"></script>

<!-- Slimscroll -->
<script src="${contextPath}/assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- FastClick -->
<script src="${contextPath}/assets/vendor_components/fastclick/lib/fastclick.js"></script>

<!-- Morris.js charts -->
<script src="${contextPath}/assets/vendor_components/raphael/raphael.min.js"></script>
<script src="${contextPath}/assets/vendor_components/morris.js/morris.min.js"></script>

<!-- This is data table -->
<script src="${contextPath}/assets/vendor_components/datatable/datatables.min.js"></script>

<!-- Superieur Admin App -->
<script src="${contextPath}/assets/js/template.js"></script>

<!-- Superieur Admin dashboard demo (This is only for demo purposes) -->
<script src="${contextPath}/assets/js/pages/dashboard.js"></script>

<!-- Superieur Admin for demo purposes -->
<script src="${contextPath}/assets/js/demo.js"></script>

<!-- Bootstrap table -->
<script src="${contextPath}/assets/vendor_components/bootstrap-table/bootstrap-table.js"></script>
<script src="${contextPath}/assets/vendor_components/bootstrap-table/bootstrap-table-zh-CN.js"></script>

<!-- Bootstrap switch -->
<script src="${contextPath}/assets/vendor_components/bootstrap-switch/bootstrap-switch.js"></script>

<!-- Bootstrap table treegrid -->
<script src="${contextPath}/assets/vendor_components/bootstrap-table-treegrid/bootstrap-table-treegrid.js"></script>
<script src="${contextPath}/assets/vendor_components/bootstrap-table-treegrid/jquery.treegrid.js"></script>

<!-- Bootstrap treeview -->
<script src="${contextPath}/assets/vendor_components/bootstrap-treeview/bootstrap-treeview.js"></script>

<!-- Bootstrap select -->
<script src="${contextPath}/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>

<!-- My Js -->
<script src="${contextPath}/js/myJs.js"></script>