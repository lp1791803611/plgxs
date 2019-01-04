<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>蓬莱阁后台管理端</title>
	
	<link rel="icon" href="../images/favicon.ico">
	<!-- Bootstrap 4.0-->
	<link rel="stylesheet" href="../assets/vendor_components/bootstrap/dist/css/bootstrap.css">
	
	<!-- Bootstrap extend-->
	<link rel="stylesheet" href="../assets/css/bootstrap-extend.css">
	
	<!-- theme style -->
	<link rel="stylesheet" href="../assets/css/master_style.css">
	
	<!-- Superieur Admin skins -->
	<link rel="stylesheet" href="../assets/css/skins/_all-skins.css">
	
	<!-- daterange picker -->	
	<link rel="stylesheet" href="../assets/vendor_components/bootstrap-daterangepicker/daterangepicker.css">
	
	<!-- Morris charts -->
	<link rel="stylesheet" href="../assets/vendor_components/morris.js/morris.css">
	
	<!-- Data Table-->
	<link rel="stylesheet" type="text/css" href="../assets/vendor_components/datatable/datatables.min.css"/>

  </head>
<body class="hold-transition skin-blue sidebar-mini">
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">
      
      <!-- sidebar menu-->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="user-profile treeview">
          <a href="index.html">
			<img src="../images/avatar/7.jpg" alt="user">
              <span>
				<span class="d-block font-weight-600 font-size-16">Samuel Brus</span>
				<span class="email-id">samuel@gmail.com</span>
			  </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
		  <ul class="treeview-menu">
            <li><a href="javascript:void()"><i class="fa fa-user mr-5"></i>My Profile </a></li>
			<li><a href="javascript:void()"><i class="fa fa-money mr-5"></i>My Balance</a></li>
			<li><a href="javascript:void()"><i class="fa fa-envelope-open mr-5"></i>Inbox</a></li>
			<li><a href="javascript:void()"><i class="fa fa-cog mr-5"></i>Account Setting</a></li>
			<li><a href="javascript:void()"><i class="fa fa-power-off mr-5"></i>Logout</a></li>
          </ul>
        </li>
        <li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>PERSONAL</li>
		
		<li class="treeview active">
          <a href="#">
            <i class="mdi mdi-view-dashboard"></i>
            <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="index.html"><i class="mdi mdi-toggle-switch-off"></i>Main Dashboard</a></li>
            <li><a href="index-2.html"><i class="mdi mdi-toggle-switch-off"></i>e-Commerce Dashboard</a></li>
            <li><a href="index-3.html"><i class="mdi mdi-toggle-switch-off"></i>Cryptocurrency</a></li>
            <li><a href="index-4.html"><i class="mdi mdi-toggle-switch-off"></i>Analytics</a></li>
            <li><a href="index-5.html"><i class="mdi mdi-toggle-switch-off"></i>Hospital</a></li>
            <li><a href="index-6.html"><i class="mdi mdi-toggle-switch-off"></i>Support System</a></li>
            <li><a href="index-7.html"><i class="mdi mdi-toggle-switch-off"></i>Sales Report</a></li>
            <li><a href="index-8.html"><i class="mdi mdi-toggle-switch-off"></i>Music</a></li>
          </ul>
        </li>  
		
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-content-copy"></i>
            <span>Layout Options</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/layout_boxed.html"><i class="mdi mdi-toggle-switch-off"></i>Boxed</a></li>
            <li><a href="pages/layout_fixed.html"><i class="mdi mdi-toggle-switch-off"></i>Fixed</a></li>
            <li><a href="pages/layout_collapsed_sidebar.html"><i class="mdi mdi-toggle-switch-off"></i>Mini Sidebar</a></li>
          </ul>
        </li>  
		
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-tune-vertical"></i>
            <span>Page Layouts </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/page_layout_inner_left_sidebar.html"><i class="mdi mdi-toggle-switch-off"></i>Inner Left Sidebar </a></li>
            <li><a href="pages/page_layout_inner_right_sidebar.html"><i class="mdi mdi-toggle-switch-off"></i>Inner Right Sidebar </a></li>
            <li><a href="pages/page_layout_inner_fixed_left_sidebar.html"><i class="mdi mdi-toggle-switch-off"></i>Inner Fixed Left Sidebar </a></li>
            <li><a href="pages/page_layout_inner_fixed_right_sidebar.html"><i class="mdi mdi-toggle-switch-off"></i>Inner Fixed Right Sidebar </a></li>
          </ul>
        </li>
		  
		
        <li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>APPS</li>
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-mailbox"></i> <span>Mailbox</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/mailbox_inbox.html"><i class="mdi mdi-toggle-switch-off"></i>Inbox</a></li>
            <li><a href="pages/mailbox_compose.html"><i class="mdi mdi-toggle-switch-off"></i>Compose</a></li>
            <li><a href="pages/mailbox_read_mail.html"><i class="mdi mdi-toggle-switch-off"></i>Read</a></li>
          </ul>
        </li>
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-contacts"></i>
            <span>Contact</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/contact_app_chat.html"><i class="mdi mdi-toggle-switch-off"></i>Chat app</a></li>
            <li><a href="pages/contact_app.html"><i class="mdi mdi-toggle-switch-off"></i>Contact / Employee</a></li>
            <li><a href="pages/contact_userlist_grid.html"><i class="mdi mdi-toggle-switch-off"></i>Userlist Grid</a></li>
			<li><a href="pages/contact_userlist.html"><i class="mdi mdi-toggle-switch-off"></i>Userlist</a></li>
          </ul>
        </li>
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-apps"></i>
            <span>Extra</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/extra_app_ticket.html"><i class="mdi mdi-toggle-switch-off"></i>Support Ticket</a></li>
			<li><a href="pages/extra_calendar.html"><i class="mdi mdi-toggle-switch-off"></i>Calendar</a></li>
            <li><a href="pages/extra_profile.html"><i class="mdi mdi-toggle-switch-off"></i>Profile</a></li>
            <li><a href="pages/extra_taskboard.html"><i class="mdi mdi-toggle-switch-off"></i>Project DashBoard</a></li>
          </ul>
        </li>
		  
		
        <li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>UI</li>
		  
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-widgets"></i>
            <span>UI Elements</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/ui_badges.html"><i class="mdi mdi-toggle-switch-off"></i>Badges</a></li>
            <li><a href="pages/ui_border_utilities.html"><i class="mdi mdi-toggle-switch-off"></i>Border</a></li>
            <li><a href="pages/ui_buttons.html"><i class="mdi mdi-toggle-switch-off"></i>Buttons</a></li>	
            <li><a href="pages/ui_color_utilities.html"><i class="mdi mdi-toggle-switch-off"></i>Color</a></li>
            <li><a href="pages/ui_dropdown.html"><i class="mdi mdi-toggle-switch-off"></i>Dropdown</a></li>
            <li><a href="pages/ui_dropdown_grid.html"><i class="mdi mdi-toggle-switch-off"></i>Dropdown Grid</a></li>
            <li><a href="pages/ui_typography.html"><i class="mdi mdi-toggle-switch-off"></i>Typography</a></li>
            <li><a href="pages/ui_progress_bars.html"><i class="mdi mdi-toggle-switch-off"></i>Progress Bars</a></li>
            <li><a href="pages/ui_grid.html"><i class="mdi mdi-toggle-switch-off"></i>Grid</a></li>
            <li><a href="pages/ui_ribbons.html"><i class="mdi mdi-toggle-switch-off"></i>Ribbons</a></li>
            <li><a href="pages/ui_sliders.html"><i class="mdi mdi-toggle-switch-off"></i>Sliders</a></li>
            <li><a href="pages/ui_tab.html"><i class="mdi mdi-toggle-switch-off"></i>Tabs</a></li>
            <li><a href="pages/ui_timeline.html"><i class="mdi mdi-toggle-switch-off"></i>Timeline</a></li>
            <li><a href="pages/ui_timeline_horizontal.html"><i class="mdi mdi-toggle-switch-off"></i>Horizontal Timeline</a></li>
          </ul>
        </li>  
		
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-chemical-weapon"></i>
            <span>Icons</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/icons_fontawesome.html"><i class="mdi mdi-toggle-switch-off"></i>Font Awesome</a></li>
            <li><a href="pages/icons_glyphicons.html"><i class="mdi mdi-toggle-switch-off"></i>Glyphicons</a></li>
            <li><a href="pages/icons_material.html"><i class="mdi mdi-toggle-switch-off"></i>Material Icons</a></li>	
            <li><a href="pages/icons_themify.html"><i class="mdi mdi-toggle-switch-off"></i>Themify Icons</a></li>
            <li><a href="pages/icons_simpleline.html"><i class="mdi mdi-toggle-switch-off"></i>Simple Line Icons</a></li>
            <li><a href="pages/icons_cryptocoins.html"><i class="mdi mdi-toggle-switch-off"></i>Cryptocoins Icons</a></li>
          </ul>
        </li> 		  
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-cube"></i>
            <span>Components</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">			
            <li><a href="pages/component_bootstrap_switch.html"><i class="mdi mdi-toggle-switch-off"></i>Bootstrap Switch</a></li>
            <li><a href="pages/component_date_paginator.html"><i class="mdi mdi-toggle-switch-off"></i>Date Paginator</a></li>
            <li><a href="pages/component_media_advanced.html"><i class="mdi mdi-toggle-switch-off"></i>Advanced Medias</a></li>
			<li><a href="pages/component_modals.html"><i class="mdi mdi-toggle-switch-off"></i>Modals</a></li>
			<li><a href="pages/component_nestable.html"><i class="mdi mdi-toggle-switch-off"></i>Nestable</a></li>
            <li><a href="pages/component_notification.html"><i class="mdi mdi-toggle-switch-off"></i>Notification</a></li>
            <li><a href="pages/component_portlet_draggable.html"><i class="mdi mdi-toggle-switch-off"></i>Draggable Portlets</a></li>
            <li><a href="pages/component_sweatalert.html"><i class="mdi mdi-toggle-switch-off"></i>Sweet Alert</a></li>
          </ul>
        </li>		  
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-checkerboard"></i>
            <span>Box Cards</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/box_cards.html"><i class="mdi mdi-toggle-switch-off"></i>User Card</a></li>
			<li><a href="pages/box_advanced.html"><i class="mdi mdi-toggle-switch-off"></i>Advanced Card</a></li>
            <li><a href="pages/box_basic.html"><i class="mdi mdi-toggle-switch-off"></i>Basic Card</a></li>
            <li><a href="pages/box_color.html"><i class="mdi mdi-toggle-switch-off"></i>Card Color</a></li>
			<li><a href="pages/box_group.html"><i class="mdi mdi-toggle-switch-off"></i>Card Group</a></li>
          </ul>
        </li>		  
        
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-waves"></i>
            <span>Widgets</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/widgets_blog.html"><i class="mdi mdi-toggle-switch-off"></i>Blog</a></li>
            <li><a href="pages/widgets_chart.html"><i class="mdi mdi-toggle-switch-off"></i>Chart</a></li>
            <li><a href="pages/widgets_list.html"><i class="mdi mdi-toggle-switch-off"></i>List</a></li>
            <li><a href="pages/widgets_social.html"><i class="mdi mdi-toggle-switch-off"></i>Social</a></li>
            <li><a href="pages/widgets_statistic.html"><i class="mdi mdi-toggle-switch-off"></i>Statistic</a></li>
            <li><a href="pages/widgets_weather.html"><i class="mdi mdi-toggle-switch-off"></i>Weather</a></li>
            <li><a href="pages/widgets.html"><i class="mdi mdi-toggle-switch-off"></i>Widgets</a></li>
          </ul>
        </li>
		  
		
        <li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>FORMS And TABLES</li> 
		
		
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-receipt"></i>
			<span>Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/forms_advanced.html"><i class="mdi mdi-toggle-switch-off"></i>Advanced Elements</a></li>
            <li><a href="pages/forms_code_editor.html"><i class="mdi mdi-toggle-switch-off"></i>Code Editor</a></li>
            <li><a href="pages/forms_editor_markdown.html"><i class="mdi mdi-toggle-switch-off"></i>Markdown</a></li>
            <li><a href="pages/forms_editors.html"><i class="mdi mdi-toggle-switch-off"></i>Editors</a></li>
            <li><a href="pages/forms_validation.html"><i class="mdi mdi-toggle-switch-off"></i>Form Validation</a></li>
            <li><a href="pages/forms_wizard.html"><i class="mdi mdi-toggle-switch-off"></i>Form Wizard</a></li>
            <li><a href="pages/forms_general.html"><i class="mdi mdi-toggle-switch-off"></i>General Elements</a></li>
            <li><a href="pages/forms_mask.html"><i class="mdi mdi-toggle-switch-off"></i>Formatter</a></li>
            <li><a href="pages/forms_xeditable.html"><i class="mdi mdi-toggle-switch-off"></i>Xeditable Editor</a></li>
          </ul>
        </li>
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-table"></i>
			<span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables_simple.html"><i class="mdi mdi-toggle-switch-off"></i>Simple tables</a></li>
            <li><a href="pages/tables_data.html"><i class="mdi mdi-toggle-switch-off"></i>Data tables</a></li>
            <li><a href="pages/tables_editable.html"><i class="mdi mdi-toggle-switch-off"></i>Editable Tables</a></li>
            <li><a href="pages/tables_color.html"><i class="mdi mdi-toggle-switch-off"></i>Table Color</a></li>
          </ul>
        </li>
		  
		
        <li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>CHARTS</li> 
		  
		<li>
          <a href="pages/charts_chartjs.html">
            <i class="mdi mdi-chart-bar"></i>
			<span>ChartJS</span>
          </a>
        </li>
		<li>
          <a href="pages/charts_flot.html">
            <i class="mdi mdi-chart-bubble"></i>
			<span>Flot</span>
          </a>
        </li> 
		<li>
          <a href="pages/charts_inline.html">
            <i class="mdi mdi-chart-donut"></i>
			<span>Inline charts</span>
          </a>
        </li> 
		<li>
          <a href="pages/charts_morris.html">
            <i class="mdi mdi-chart-gantt"></i>
			<span>Morris</span>
          </a>
        </li>  
		<li>
          <a href="pages/charts_peity.html">
            <i class="mdi mdi-chart-bubble"></i>
			<span>Peity</span>
          </a>
        </li> 
		<li>
          <a href="pages/charts_chartist.html">
            <i class="mdi mdi-chart-line"></i>
			<span>Chartist</span>
          </a>
        </li> 
		  
		  
		<li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>EXTRA COMPONENTS</li>
		  
		<li>
          <a href="pages/email_index.html">
            <i class="mdi mdi-email"></i>
			<span>Emails</span>
          </a>
        </li>  
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-map-marker"></i>
			<span>Map</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/map_google.html"><i class="mdi mdi-toggle-switch-off"></i>Google Map</a></li>
            <li><a href="pages/map_vector.html"><i class="mdi mdi-toggle-switch-off"></i>Vector Map</a></li>
          </ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-gradient"></i>
			<span>Extension</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/extension_fullscreen.html"><i class="mdi mdi-toggle-switch-off"></i>Fullscreen</a></li>
			<li><a href="pages/extension_pace.html"><i class="mdi mdi-toggle-switch-off"></i>Pace</a></li>
          </ul>
        </li> 
		  
		  
		<li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>SAMPLE PAGES</li>
		  
		
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-cart-outline"></i>
			<span>Ecommerce Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/ecommerce_products.html"><i class="mdi mdi-toggle-switch-off"></i>Products</a></li>
            <li><a href="pages/ecommerce_cart.html"><i class="mdi mdi-toggle-switch-off"></i>Products Cart</a></li>
            <li><a href="pages/ecommerce_products_edit.html"><i class="mdi mdi-toggle-switch-off"></i>Products Edit</a></li>
            <li><a href="pages/ecommerce_details.html"><i class="mdi mdi-toggle-switch-off"></i>Product Details</a></li>
            <li><a href="pages/ecommerce_orders.html"><i class="mdi mdi-toggle-switch-off"></i>Product Orders</a></li>
            <li><a href="pages/ecommerce_checkout.html"><i class="mdi mdi-toggle-switch-off"></i>Products Checkout</a></li>
          </ul>
        </li>		  
		  
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-account-circle"></i>
			<span>Authentication</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/auth_login.html"><i class="mdi mdi-toggle-switch-off"></i>Login</a></li>
            <li><a href="pages/auth_login2.html"><i class="mdi mdi-toggle-switch-off"></i>Login 2</a></li>
			<li><a href="pages/auth_register.html"><i class="mdi mdi-toggle-switch-off"></i>Register</a></li>
			<li><a href="pages/auth_register2.html"><i class="mdi mdi-toggle-switch-off"></i>Register 2</a></li>
			<li><a href="pages/auth_lockscreen.html"><i class="mdi mdi-toggle-switch-off"></i>Lockscreen</a></li>
			<li><a href="pages/auth_user_pass.html"><i class="mdi mdi-toggle-switch-off"></i>Recover password</a></li>	
          </ul>
        </li> 		  
		  
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-ungroup"></i>
			<span>Invoice</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="pages/invoice.html"><i class="mdi mdi-toggle-switch-off"></i>Invoice</a></li>
			<li><a href="pages/invoicelist.html"><i class="mdi mdi-toggle-switch-off"></i>Invoice List</a></li>	
          </ul>
        </li>		  
		  
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-alert-box"></i>
			<span>Error Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="pages/error_400.html"><i class="mdi mdi-toggle-switch-off"></i>Error 400</a></li>
			<li><a href="pages/error_403.html"><i class="mdi mdi-toggle-switch-off"></i>Error 403</a></li>
			<li><a href="pages/error_404.html"><i class="mdi mdi-toggle-switch-off"></i>Error 404</a></li>
			<li><a href="pages/error_500.html"><i class="mdi mdi-toggle-switch-off"></i>Error 500</a></li>
			<li><a href="pages/error_503.html"><i class="mdi mdi-toggle-switch-off"></i>Error 503</a></li>
			<li><a href="pages/error_maintenance.html"><i class="mdi mdi-toggle-switch-off"></i>Maintenance</a></li>	
          </ul>
        </li>   
		  
		<li class="treeview">
          <a href="#">
            <i class="mdi mdi-file"></i>
			<span>Sample Pages</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/sample_blank.html"><i class="mdi mdi-toggle-switch-off"></i>Blank</a></li>
            <li><a href="pages/sample_coming_soon.html"><i class="mdi mdi-toggle-switch-off"></i>Coming Soon</a></li>
            <li><a href="pages/sample_custom_scroll.html"><i class="mdi mdi-toggle-switch-off"></i>Custom Scrolls</a></li>
			<li><a href="pages/sample_faq.html"><i class="mdi mdi-toggle-switch-off"></i>FAQ</a></li>
			<li><a href="pages/sample_gallery.html"><i class="mdi mdi-toggle-switch-off"></i>Gallery</a></li>
			<li><a href="pages/sample_lightbox.html"><i class="mdi mdi-toggle-switch-off"></i>Lightbox Popup</a></li>
			<li><a href="pages/sample_pricing.html"><i class="mdi mdi-toggle-switch-off"></i>Pricing</a></li>
          </ul>
        </li>
		  
		  
		<li class="header nav-small-cap"><i class="mdi mdi-drag-horizontal mr-5"></i>EXTRA</li>		  
		  
        <li class="treeview">
          <a href="#">
            <i class="mdi mdi-notification-clear-all"></i>
			<span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">Level One</a></li>
            <li class="treeview">
              <a href="#">Level One
                <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#">Level Two</a></li>
                <li class="treeview">
                  <a href="#">Level Two
                    <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="#">Level Three</a></li>
                    <li><a href="#">Level Three</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#">Level One</a></li>
          </ul>
        </li>  
		  
		<li>
          <a href="pages/auth_login.html">
            <i class="mdi mdi-directions"></i>
			<span>Log Out</span>
          </a>
        </li> 
        
      </ul>
    </section>
  </aside>

	<!-- jQuery 3 -->
	<script src="../assets/vendor_components/jquery-3.3.1/jquery-3.3.1.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="../assets/vendor_components/jquery-ui/jquery-ui.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- popper -->
	<script src="../assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- date-range-picker -->
	<script src="../assets/vendor_components/moment/min/moment.min.js"></script>
	<script src="../assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<!-- Bootstrap 4.0-->
	<script src="../assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>	
	
	<!-- ChartJS -->
	<script src="../assets/vendor_components/chart.js-master/Chart.min.js"></script>
	
	<!-- Slimscroll -->
	<script src="../assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- FastClick -->
	<script src="../assets/vendor_components/fastclick/lib/fastclick.js"></script>
		
	<!-- Morris.js charts -->
	<script src="../assets/vendor_components/raphael/raphael.min.js"></script>
	<script src="../assets/vendor_components/morris.js/morris.min.js"></script>

	<!-- This is data table -->
    <script src="../assets/vendor_components/datatable/datatables.min.js"></script>
	
	<!-- Superieur Admin App -->
	<script src="../assets/js/template.js"></script>
	
	<!-- Superieur Admin dashboard demo (This is only for demo purposes) -->
	<script src="../assets/js/pages/dashboard.js"></script>
	
	<!-- Superieur Admin for demo purposes -->
	<script src="../assets/js/demo.js"></script>	
</body>
</html>