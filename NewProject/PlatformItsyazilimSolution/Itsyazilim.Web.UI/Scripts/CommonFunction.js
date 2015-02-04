function CollapseGroups(e) {

    var elem, evt = e ? e : event;
    if (evt.srcElement) elem = evt.srcElement;
    else if (evt.target) elem = evt.target;

    var gridContent = $(elem).find('.t-grid-content');

    ShowLoading();
    $(gridContent).hide();
    setTimeout(function () {
        /* collapse all row if any*/
        var table = $(gridContent)[0];

        var hasGrouping = $(gridContent).find('.t-grouping-row')
        if (hasGrouping.length == 0) {
            $(gridContent).show();
            return;
        }
        var trs = table.getElementsByTagName('tr');
        $.each(trs, function (i, item) {
            if (item.className == "t-grouping-row") {
                var anchors = item.getElementsByTagName('a');
                anchors[0].className = "t-icon t-icon t-expand";
                if (item.childNodes[0].className == 't-group-cell')
                    item.style.display = "none";
            }
            else {
                item.style.display = "none";
            }
        });
        $(gridContent).show();
    }, 200);
    HideLoading();
}

function RefreshGrid(gridId) {
    var grid = $("#" + gridId).data("t-Grid");
    //grid.rebind();
    grid.ajaxRequest();
}