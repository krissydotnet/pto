$(document).ready(function () {
 

    $('.txtDate').datepicker({
        beforeShow: function (textbox, instance) {
            instance.dpDiv.css({
                marginTop: (-textbox.offsetHeight) + 'px',
                marginLeft: textbox.offsetWidth + 'px'
            });
        }
    });

});