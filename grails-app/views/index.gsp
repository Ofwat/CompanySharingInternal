<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta name="layout" content="main"/>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Welcome to Company Sharing</title>
		<style type="text/css" media="screen">
		</style>
	</head>
	<body>


	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>Company Sharing Internal</h3>
			</div>

			<div class="title_right">
				<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>Home Page <small>Latest News And Updates</small></h2>
						<ul class="nav navbar-right panel_toolbox">
						</ul>
						<div class="clearfix"></div>
					</div>

					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Latest News <small></small></h2>

								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<ul>
									<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
									<li>Etiam feugiat velit quis nisl volutpat, fermentum tempus quam tempus.</li>
									<li>Integer efficitur metus id libero pellentesque tempor.</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="x_panel">
							<div class="x_title">
								<h2>Published Collections<small> current published collections</small></h2>

								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<ul>
									<li>Collection 1</li>
									<li>Collection 2</li>
									<li>Collection 3</li>
									<li>Collection 4</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="x_panel">
							<div class="x_title">
								<h2>Application Status <small></small></h2>

								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<ul>
									<li>App version: <g:meta name="app.version"/></li>
									<li>Grails version: <g:meta name="app.grails.version"/></li>
									<li>Groovy version: ${GroovySystem.getVersion()}</li>
									<li>JVM version: ${System.getProperty('java.version')}</li>
									<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
									<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
									<li>Domains: ${grailsApplication.domainClasses.size()}</li>
									<li>Services: ${grailsApplication.serviceClasses.size()}</li>
									<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
								</ul>
							</div>
						</div>
					</div>

					<div>


							%{--<h1>Installed Plugins</h1>--}%
							%{--<ul>--}%
								%{--<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">--}%
									%{--<li>${plugin.name} - ${plugin.version}</li>--}%
								%{--</g:each>--}%
							%{--</ul>--}%
						</div>

						<!-- End content here -->





						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>























	</body>
</html>
