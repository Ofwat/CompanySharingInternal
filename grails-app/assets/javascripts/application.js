// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require ../bower-components/gentelella/vendors/jquery/dist/jquery.min.js
//= require ../bower-components/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js
//= require ../bower-components/gentelella/vendors/fastclick/lib/fastclick.js
//= require ../bower-components/gentelella/vendors/nprogress/nprogress.js
//= require ../bower-components/gentelella/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js
//= require ../bower-components/gentelella/vendors/iCheck/icheck.min.js
//= require ../bower-components/gentelella/vendors/moment/min/moment.min.js
//= require ../bower-components/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.js
//= require ../bower-components/gentelella/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js
//= require ../bower-components/gentelella/vendors/jquery.hotkeys/jquery.hotkeys.js
//= require ../bower-components/gentelella/vendors/google-code-prettify/src/prettify.js
//= require ../bower-components/gentelella/vendors/jquery.tagsinput/src/jquery.tagsinput.js
//= require ../bower-components/gentelella/vendors/switchery/dist/switchery.min.js
//= require ../bower-components/gentelella/vendors/select2/dist/js/select2.full.min.js
//= require ../bower-components/gentelella/vendors/parsleyjs/dist/parsley.min.js
//= require ../bower-components/gentelella/vendors/autosize/dist/autosize.min.js
//= require ../bower-components/gentelella/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js
//= require ../bower-components/gentelella/vendors/starrr/dist/starrr.js
//= require ../bower-components/gentelella/build/js/custom.js
//= require ../bower-components/gentelella/vendors/pnotify/dist/pnotify.js
//= require ../bower-components/gentelella/vendors/dropzone/dist/dropzone.js

//= require ../bower-components/gentelella/vendors/datatables.net/js/jquery.dataTables.js

//= require ../bower-components/gentelella/vendors/datatables.net-buttons/js/dataTables.buttons.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-buttons/js/buttons.flash.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-buttons/js/buttons.html5.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-buttons/js/buttons.print.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-responsive/js/dataTables.responsive.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js
//= require ../bower-components/gentelella/vendors/datatables.net-scroller/js/dataTables.scroller.min.js
//= require ../bower-components/gentelella/vendors/datatables.net-bs/js/dataTables.bootstrap.js
//= require ../bower-components/gentelella/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.js
//= require ../bower-components/gentelella/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js
//= require trix/trix.js
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$(document).ajaxStart(function(){
			$('#spinner').fadeIn();
		}).ajaxStop(function(){
			$('#spinner').fadeOut();
		});
	})(jQuery);
}

var showSuccessMessage = function(title, message){
    if (title == null) {
        title = "It Worked!";
    }
    if (message == null) {
        message = "Success!";
    }
    new PNotify({
        title: title,
        text: message,
        type: 'success',
        styling:'bootstrap3'
    });
}

var showErrorMessage = function (title, message) {
    if (title == null) {
        title = "Something went wrong!";
    }
    if (message == null) {
        message = "Sorry there was a problem";
    }
    new PNotify({
        title: title,
        text: message,
        type: 'error',
        styling:'bootstrap3'
    });
}

