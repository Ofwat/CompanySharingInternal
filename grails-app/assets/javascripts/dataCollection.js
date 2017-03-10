$(document).ready(function() {
    dataCollectionFeature = (function() {

        var createDatePickers = function () {
            $('#publishEndDate').daterangepicker({
                "singleDatePicker": true,
                "timePicker": true,
                "timePicker24Hour": true,
                "timePickerIncrement": 5,
                "linkedCalendars": false,
                "showCustomRangeLabel": false,
                "minDate": new Date(),
                locale: {
                    format: 'DD/MM/YYYY HH:mm'
                },
            }, function (start, end, label) {
                console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
            });
            $('#publishStartDate').daterangepicker({
                "singleDatePicker": true,
                "timePicker": true,
                "timePicker24Hour": true,
                "timePickerIncrement": 5,
                "linkedCalendars": false,
                "showCustomRangeLabel": false,
                "minDate": new Date(),
                locale: {
                    format: 'DD/MM/YYYY HH:mm'
                },
            }, function (start, end, label) {
                console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
            });
            $('#completionDate').daterangepicker({
                "singleDatePicker": true,
                "timePicker": true,
                "timePicker24Hour": true,
                "timePickerIncrement": 5,
                "linkedCalendars": false,
                "showCustomRangeLabel": false,
                "minDate": new Date(),
                locale: {
                    format: 'DD/MM/YYYY HH:mm'
                },
            }, function (start, end, label) {
                console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
            });
            /*
            $('#published').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-green'
            });
            $('#completed').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-green'
            });
            */
            $(':checkbox').each(function(index, it){
                if($(it).hasClass("js-switch")){

                }else {
                    $(it).iCheck({
                        checkboxClass: 'icheckbox_flat-blue',
                        radioClass: 'iradio_flat-green'
                    });
                }
            });
        }

        return {
            createDatePickers:createDatePickers
        }
    })();
    dataCollectionFeature.createDatePickers();
});