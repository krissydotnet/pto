
function openNavmenu() {
    document.getElementById("mySidenavmenu").style.width = "260px";
}

function closeNav() {
    document.getElementById("mySidenavmenu").style.width = "0";
}

$(function () {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        contentHeight: 200
    });

});