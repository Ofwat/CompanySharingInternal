<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Ofwat Company Sharing | <g:layoutTitle default="Home"/></title>
	<asset:stylesheet href="application.css"></asset:stylesheet>
	<g:layoutHead/>
</head>

<body class="nav-md">
<div class="container body">
	<div class="main_container">

		<menuTagLib:companySharingMenu></menuTagLib:companySharingMenu>

		<div class="top_nav">
			<div class="nav_menu">
				<nav>
					<div class="nav toggle" style="min-height:55px;">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<ul class="nav navbar-nav navbar-right">
						<li>&nbsp;</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- page content -->
		<div class="right_col" role="main" style="min-height: 1657px;">
			<g:layoutBody/>
		</div>
		<!-- /page content -->

		<footer>
			<div class="pull-right">
				Ofwat Foooter Info
			</div>
			<div class="clearfix"></div>
		</footer>

	</div>
</div>
<asset:javascript src="application.js"/>
<!-- Custom placeholder for page scripts -->
<asset:deferredScripts/>
</body>
</html>