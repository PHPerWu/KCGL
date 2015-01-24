$(document).ready(function () {
    jsAspxDateEdit_rqq.AfterPopupControlResizing = function () {
        $(".dxCalendarFooter").hide();
        $(".dxMonthGridWithWeekNumbers").hide();
    };
    jsAspxDateEdit_rqq.GetCalendar().VisibleMonthChanged.AddHandler
        (
            function (s, e) {
                jsAspxDateEdit_rqq.ApplyParsedDate(s.GetVisibleDate(), true);
                jsAspxDateEdit_rqq.ToggleDropDown();
                // to do a postback
                jsAspxDateEdit.GetCalendar().SendPostBack("");
            }
        );
    jsAspxDateEdit_rqz.AfterPopupControlResizing = function () {
        $(".dxCalendarFooter").hide();
        $(".dxMonthGridWithWeekNumbers").hide();
    };
    jsAspxDateEdit_rqz.GetCalendar().VisibleMonthChanged.AddHandler
        (
            function (s, e) {
                jsAspxDateEdit_rqz.ApplyParsedDate(s.GetVisibleDate(), true);
                jsAspxDateEdit_rqz.ToggleDropDown();
                // to do a postback
                jsAspxDateEdit.GetCalendar().SendPostBack("");
            }
        );
});