$(document).ready(function () {
    $("#new-requests").hide();
    $("#view-new-requests").click(() => {
        $("#new-requests").slideToggle();
        $(this).find(".rotate").toggleClass("down");
    });
   // $("#myModal").appendTo($("form:first"));
});
