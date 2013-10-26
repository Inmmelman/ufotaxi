<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<!--	<?php /*print $this->bep_site->get_metatags(); */?>
	<title><?php /*print $header.' | '.$this->preference->item('site_name')*/?></title>
	<?php /*print $this->bep_site->get_variables()*/?>
	<?php /*print $this->bep_assets->get_header_assets();*/?>
	--><?php /*print $this->bep_site->get_js_blocks()*/?>
	<link rel="stylesheet"
		  href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/themes/base/minified/jquery-ui.min.css"
		  type="text/css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6c_Urt2OXENfmiXc3vTQBlbi2UeaF7dA&sensor=true"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=true"></script>
<!--	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&v=3&libraries=geometry"></script>-->
	<script type="text/javascript" src="<?php echo base_url() ?>assets/grocery_crud/js/project_scripts/map.js"></script>
	<script type="text/javascript" src="<?php echo base_url() ?>assets/grocery_crud/js/project_scripts/general.js"></script>
</head>

<body>
<div id="wrapper">
	<div id="header">
		<!-- <h1><?php /*print $this->preference->item('site_name')*/?></h1>-->
	</div>