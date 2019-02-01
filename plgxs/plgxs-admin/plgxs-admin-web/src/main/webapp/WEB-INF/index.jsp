<%--
  user: Strangers。
  date: 2019/1/31
  time: 15:26  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${contextPath}/images/favicon.ico">
    <title>蓬莱阁小说后台管理平台</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Heade Navbar, Control Sidebar-->
    <%@include file="head.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="left.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="page-title">Dashboard</h3>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">Control</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="right-title w-170">
				<span class="subheader_daterange font-weight-600" id="dashboard_daterangepicker">
					<span class="subheader_daterange-label">
						<span class="subheader_daterange-title"></span>
						<span class="subheader_daterange-date text-primary"></span>
					</span>
					<a href="#" class="btn btn-sm btn-primary">
						<i class="fa fa-angle-down"></i>
					</a>
				</span>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="row">
                        <div class="col-12">
                            <div class="box bg-img box-inverse"
                                 style="background-image: url(../images/gallery/full/10.jpg);" data-overlay="7">
                                <div class="box-header with-border">
                                    <h4 class="box-title">Latest</h4>
                                    <ul class="box-controls pull-right">
                                        <li><a class="box-btn-close" href="#"></a></li>
                                        <li><a class="box-btn-fullscreen" href="#"></a></li>
                                    </ul>
                                </div>
                                <div class="box-body mt-20">
                                    <span class="badge" data-overlay="5">New</span>
                                    <h2 class="font-weight-200 mb-0">Contrary to popular belief</h2>
                                    <p>There are many variations of passages</p>
                                    <ul class="flexbox flex-justified mt-20">
                                        <li>
                                            <p class="font-size-20 text-success mb-0 font-weight-300"><i
                                                    class="fa fa-caret-up text-success"></i> +1.92%
                                                <small class="font-size-12">41,425.81</small>
                                            </p>
                                            <p> QWDR</p>
                                        </li>

                                        <li>
                                            <p class="font-size-20 text-danger mb-0 font-weight-300"><i
                                                    class="fa fa-caret-down text-danger"></i> -0.92%
                                                <small class="font-size-12">54,425.81</small>
                                            </p>
                                            <p> WSDF</p>
                                        </li>

                                        <li>
                                            <p class="font-size-20 text-success mb-0 font-weight-300"><i
                                                    class="fa fa-caret-up text-success"></i> +1.12%
                                                <small class="font-size-12">85,425.81</small>
                                            </p>
                                            <p> AERV</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="box box-body">
                                <h6 class="mb-30">
                                    <span class="text-uppercase">Revenue</span>
                                    <span class="float-right"><a class="btn btn-xs btn-primary" href="#">View</a></span>
                                </h6>

                                <p class="font-size-26">$845,1258</p>

                                <div class="progress progress-xxs mt-0 mb-10">
                                    <div class="progress-bar bg-danger" role="progressbar"
                                         style="width: 35%; height: 4px;" aria-valuenow="35" aria-valuemin="0"
                                         aria-valuemax="100"></div>
                                </div>
                                <div class="font-size-12"><i class="ion-arrow-graph-down-right text-success mr-1"></i>
                                    %18 decrease from last month
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="box box-body">
                                <h6 class="mb-30">
                                    <span class="text-uppercase">SELLS</span>
                                    <span class="float-right"><a class="btn btn-xs btn-primary" href="#">View</a></span>
                                </h6>

                                <p class="font-size-26">15,958</p>

                                <div class="progress progress-xxs mt-0 mb-10">
                                    <div class="progress-bar bg-success" role="progressbar"
                                         style="width: 75%; height: 4px;" aria-valuenow="35" aria-valuemin="0"
                                         aria-valuemax="100"></div>
                                </div>
                                <div class="font-size-12"><i class="ion-arrow-graph-up-right text-success mr-1"></i>
                                    12548 more than last year
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-12 col-lg-4">
                    <div class="box">
                        <div class="box-inverse bg-danger bg-bubbles-dark">
                            <div class="box-header no-border">
                                <h4>Total Income</h4>
                                <ul class="box-controls pull-right">
                                    <li class="dropdown">
                                        <a data-toggle="dropdown" href="#"
                                           class="btn btn-rounded btn-outline btn-white px-10">Stats</a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
                                            <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
                                            <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="box-body pb-60">
                                <h1 class="text-center font-size-50">
                                    <small>$</small>
                                    84,125,859
                                </h1>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="text-center py-10 bb-1 bb-dashed">
                                <h4>Monthly Income</h4>
                                <ul class="flexbox flex-justified text-center my-20">
                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold">8952</h6>
                                        <small>Abu Dhabi</small>
                                    </li>

                                    <li class="br-1 bl-1 px-10">
                                        <h6 class="mb-0 text-bold">7458</h6>
                                        <small>Miami</small>
                                    </li>

                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold">3254</h6>
                                        <small>London</small>
                                    </li>
                                </ul>
                            </div>
                            <div class="text-center py-10 bb-1 bb-dashed">
                                <h4>Taxes info</h4>
                                <ul class="flexbox flex-justified text-center my-20">
                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold">8952</h6>
                                        <small>Abu Dhabi</small>
                                    </li>

                                    <li class="br-1 bl-1 px-10">
                                        <h6 class="mb-0 text-bold">7458</h6>
                                        <small>Miami</small>
                                    </li>

                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold">3254</h6>
                                        <small>London</small>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-2">
                    <div class="box">
                        <div class="box-body">
                            <div class="flexbox">
                                <h5>Overdue</h5>
                                <div class="dropdown">
                                    <span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                            class="ion-android-more-vertical rotate-90"></i></span>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#"><i class="ion-android-list"></i> Details</a>
                                        <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add new</a>
                                        <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                            Refresh</a>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center my-2">
                                <div class="font-size-60">185</div>
                                <span>Tasks</span>
                            </div>
                        </div>

                        <div class="box-body bg-gray-light py-20">
                            <span class="text-muted mr-1">Overdue:</span>
                            <span class="text-dark">45</span>
                        </div>

                        <div class="progress progress-sm mt-0 mb-0">
                            <div class="progress-bar bg-info-gradient-animet" role="progressbar" style="width: 72%;"
                                 aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="box bg-primary">

                        <div class="progress progress-sm mt-0 mb-0">
                            <div class="progress-bar bg-primary-gradient-animet" role="progressbar" style="width: 65%;"
                                 aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>

                        <div class="card-body bg-gray-light py-20">
                            <span class="text-muted mr-1">Completed:</span>
                            <span class="text-dark">125</span>
                        </div>

                        <div class="box-body">
                            <div class="flexbox pull-right">
                                <div class="dropdown">
                                    <span class="dropdown-toggle no-caret" data-toggle="dropdown"><i
                                            class="ion-android-more-vertical"></i></span>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#"><i class="ion-android-list"></i> Details</a>
                                        <a class="dropdown-item" href="#"><i class="ion-android-add"></i> Add new</a>
                                        <a class="dropdown-item" href="#"><i class="ion-android-refresh"></i>
                                            Refresh</a>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center pb-5 mb-1">
                                <h5 class="m-0">Tasks</h5>
                                <div class="font-size-60 text-white">425</div>
                                <span class="text-white">Due Tasks</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-lg-4 col-12">
                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Tasks</h4>

                            <ul class="box-controls pull-right">
                                <li><a class="box-btn-close" href="#"></a></li>
                                <li><a class="box-btn-slide" href="#"></a></li>
                                <li><a class="box-btn-fullscreen" href="#"></a></li>
                            </ul>
                        </div>
                        <div class="box-body p-0">
                            <ul class="todo-list">
                                <li class="p-15">
                                    <div class="box p-15 mb-0 d-block bb-2 border-danger">
                                        <!-- drag handle -->
                                        <span class="handle">
						<i class="fa fa-ellipsis-v"></i>
						<i class="fa fa-ellipsis-v"></i>
					  </span>
                                        <!-- checkbox -->
                                        <input type="checkbox" id="basic_checkbox_22" class="filled-in">
                                        <label for="basic_checkbox_22" class="mb-0 h-15 ml-15"></label>
                                        <span class="pull-right badge badge-danger">Urgent</span>
                                        <span class="font-size-18 text-line"><a href="">Nulla vitae purus</a> </span>
                                        <ul class="list-inline mb-0 mt-15 ml-30">
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="Username">
                                                    <img src="../images/avatar/1.jpg" alt="img"
                                                         class="avatar avatar-sm">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="5 Tasks">
                                                    <i class="mdi mdi-format-align-left"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="3 Comments">
                                                    <i class="mdi mdi-comment"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="p-15">
                                    <div class="box p-15 mb-0 d-block bb-2 border-warning">
                                        <!-- drag handle -->
                                        <span class="handle">
						<i class="fa fa-ellipsis-v"></i>
						<i class="fa fa-ellipsis-v"></i>
					  </span>
                                        <!-- checkbox -->
                                        <input type="checkbox" id="basic_checkbox_23" class="filled-in">
                                        <label for="basic_checkbox_23" class="mb-0 h-15 ml-15"></label>
                                        <span class="pull-right badge badge-warning">High</span>
                                        <span class="font-size-18 text-line"><a href="">Maecenas scelerisque</a> </span>
                                        <ul class="list-inline mb-0 mt-15 ml-30">
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="Username">
                                                    <img src="../images/avatar/2.jpg" alt="img"
                                                         class="avatar avatar-sm">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="5 Tasks">
                                                    <i class="mdi mdi-format-align-left"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="3 Comments">
                                                    <i class="mdi mdi-comment"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="p-15">
                                    <div class="box p-15 mb-0 d-block bb-2 border-secondary">
                                        <!-- drag handle -->
                                        <span class="handle">
						<i class="fa fa-ellipsis-v"></i>
						<i class="fa fa-ellipsis-v"></i>
					  </span>
                                        <!-- checkbox -->
                                        <input type="checkbox" id="basic_checkbox_24" class="filled-in">
                                        <label for="basic_checkbox_24" class="mb-0 h-15 ml-15"></label>
                                        <span class="font-size-18 text-line"><a href="">Vivamus nec orci</a> </span>
                                        <ul class="list-inline mb-0 mt-15 ml-30">
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="Username">
                                                    <img src="../images/avatar/3.jpg" alt="img"
                                                         class="avatar avatar-sm">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="5 Tasks">
                                                    <i class="mdi mdi-format-align-left"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="3 Comments">
                                                    <i class="mdi mdi-comment"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="p-15">
                                    <div class="box p-15 mb-0 d-block bb-2 border-info">
                                        <!-- drag handle -->
                                        <span class="handle">
						<i class="fa fa-ellipsis-v"></i>
						<i class="fa fa-ellipsis-v"></i>
					  </span>
                                        <!-- checkbox -->
                                        <input type="checkbox" id="basic_checkbox_25" class="filled-in">
                                        <label for="basic_checkbox_25" class="mb-0 h-15 ml-15"></label>
                                        <span class="font-size-18 text-line"><a href="">Nulla vitae purus</a> </span>
                                        <ul class="list-inline mb-0 mt-15 ml-30">
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="Username">
                                                    <img src="../images/avatar/4.jpg" alt="img"
                                                         class="avatar avatar-sm">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="5 Tasks">
                                                    <i class="mdi mdi-format-align-left"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" data-toggle="tooltip" data-container="body" title=""
                                                   data-original-title="3 Comments">
                                                    <i class="mdi mdi-comment"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                            </ul>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>

                <div class="col-12 col-lg-8">
                    <!-- AREA CHART -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Revenue Statistics</h4>

                            <ul class="box-controls pull-right">
                                <li><a class="box-btn-close" href="#"></a></li>
                                <li><a class="box-btn-slide" href="#"></a></li>
                                <li><a class="box-btn-fullscreen" href="#"></a></li>
                            </ul>
                        </div>
                        <div class="box-body chart-responsive">
                            <div class="chart" id="revenue-chart" style="height: 472px;"></div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </div>


                <div class="col-12 col-lg-5">
                    <!-- AREA CHART -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Sales Analytics</h4>
                            <ul class="box-controls pull-right">
                                <li><a class="box-btn-close" href="#"></a></li>
                                <li><a class="box-btn-slide" href="#"></a></li>
                                <li><a class="box-btn-fullscreen" href="#"></a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <ul class="flexbox flex-justified text-center my-10">
                                <li>
                                    <p class="mb-0">Traffic</p>
                                    <div class="font-size-20 mb-5">4854,22k</div>
                                    <div class="font-size-18 text-success">
                                        <i class="fa fa-arrow-up pr-5"></i><span>+18%</span>
                                    </div>
                                </li>

                                <li class="br-1 bl-1">
                                    <p class="mb-0">Orders</p>
                                    <div class="font-size-20 mb-5">854,512k</div>
                                    <div class="font-size-18 text-success">
                                        <i class="fa fa-arrow-up pr-5"></i><span>+9%</span>
                                    </div>
                                </li>

                                <li>
                                    <p class="mb-0">Revenue</p>
                                    <div class="font-size-20 mb-5">4875,84k</div>
                                    <div class="font-size-18 text-danger">
                                        <i class="fa fa-arrow-down pr-5"></i><span>-8%</span>
                                    </div>
                                </li>
                            </ul>
                            <div class="chart-responsive">
                                <div class="chart" id="bar-chart" style="height: 476px;"></div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>

                <div class="col-lg-7 col-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Invoice List</h4>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table id="invoice-list" class="table table-hover no-wrap" data-page-size="10">
                                    <thead>
                                    <tr>
                                        <th>#Invoice</th>
                                        <th>Description</th>
                                        <th>Amount</th>
                                        <th>Status</th>
                                        <th>Issue</th>
                                        <th>View</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>#5010</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$548</td>
                                        <td><span class="label label-danger">Unpaid</span></td>
                                        <td>15-Jan</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5011</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$548</td>
                                        <td><span class="label label-success">Paid</span></td>
                                        <td>15-Sep</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5012</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$9658</td>
                                        <td><span class="label label-danger">Unpaid</span></td>
                                        <td>15-Jun</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5013</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$4587</td>
                                        <td><span class="label label-success">Paid</span></td>
                                        <td>15-May</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5014</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$856</td>
                                        <td><span class="label label-danger">Unpaid</span></td>
                                        <td>15-Mar</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5015</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$956</td>
                                        <td><span class="label label-danger">Unpaid</span></td>
                                        <td>15-Aug</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5016</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$745</td>
                                        <td><span class="label label-success">Paid</span></td>
                                        <td>15-Aug</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5013</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$4587</td>
                                        <td><span class="label label-success">Paid</span></td>
                                        <td>15-May</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#5014</td>
                                        <td>Lorem Ipsum</td>
                                        <td>$856</td>
                                        <td><span class="label label-danger">Unpaid</span></td>
                                        <td>15-Mar</td>
                                        <td>
                                            <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /. box -->
                </div>

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- foot -->
    <%@include file="foot.jsp" %>
</div>
<!-- ./wrapper -->

<!-- 引入公共js -->
<%@include file="javascript.jsp" %>
</body>
</html>

