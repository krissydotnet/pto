$(document).ready(function () {
    //$('ptoFrom').fadeOut();
    //console.log("Hello");
    //console.log($('.ptoFrom'));
    //$('.ptoFrom').datepicker();
   // $('#ptoTo').datepicker();

    $('.ptoFrom').datepicker({
        beforeShow: function (textbox, instance) {
            instance.dpDiv.css({
                marginTop: (-textbox.offsetHeight) + 'px',
                marginLeft: textbox.offsetWidth + 'px'
            });
        }
    });

    $('.ptoTo').datepicker({
        beforeShow: function (textbox, instance) {
            instance.dpDiv.css({
                marginTop: (-textbox.offsetHeight) + 'px',
                marginLeft: textbox.offsetWidth + 'px'
            });
        }
    });


});
