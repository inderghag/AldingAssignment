$.noConflict();
jQuery(document).ready(function ($) {
    $(function () {
        $('#birthDateBox').datepicker(
            {
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
    });

});
function ValidateFoodCheckList(sender, args) {
    var checkBoxList = document.getElementById("MainContent_foodCheckList");
    var checkboxes = checkBoxList.getElementsByTagName("input");
    var isValid = false;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            isValid = true;
            break;
        }
    }
    args.IsValid = isValid;
}