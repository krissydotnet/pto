$(document).ready(function () {
   
    $('.ptoTo').on('change', function () {
        let fromDate = $('.ptoFrom').val();
        let toDate = $(this).val();

        if (toDate === fromDate) {
            $('#rowHours').show();
        } else {
            $('#rowHours').hide();
        }

    }
    );
    
    

    

});

function onSelectedStartDate(sender, args) {
    $find("toDate").set_selectedDate(sender.get_selectedDate());
}


