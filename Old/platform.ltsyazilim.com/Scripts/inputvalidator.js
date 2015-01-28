var EmInputError = '<em for="%for%" class="invalid" style="display:none">%message%</em>';

function CharIsNumber(key) {
    if (
    key >= 48 && key <= 57 ||
    key >= 96 && key <= 105 ||
    key >= 112 && key <= 123 ||
    key == 8 || key == 9 || key == 13 ||
    key == 35 || key == 36 ||
    key == 37 || key == 39 ||
    key == 46 || key == 45) {
        return true;
    }
    else {
        return false;
    }
}




function SetInputs() {
    for (var form in forms) {
        if (forms.hasOwnProperty(form)) {
            for (var input in forms[form].input) {
                if ($('#' + input).length > 0) {
                    if (window["forms"][form].input[$('#' + input).attr("id")].livecheck == undefined) window["forms"][form].input[$('#' + input).attr("id")].livecheck = window["forms"][form].setting.livecheck;
                    if (window["forms"][form].input[$('#' + input).attr("id")].highlightsuccess == undefined) window["forms"][form].input[$('#' + input).attr("id")].highlightsuccess = window["forms"][form].setting.highlightsuccess;
                    if (window["forms"][form].input[$('#' + input).attr("id")].error_null_delay == undefined) window["forms"][form].input[$('#' + input).attr("id")].error_null_delay = window["forms"][form].setting.error_null_delay;
                   
                    window["forms"][form].input[$('#' + input).attr("id")].oldvalue = $('#' + input).val();

                    if (window["forms"][form].input[$('#' + input).attr("id")].livecheck)
                        $("#" + input).on("input", function (e) { CheckInput(this, window["forms"]["form1"].input[$(this).attr("id")].error_null_delay); });

                    if (window["forms"][form].input[$('#' + input).attr("id")].digits) {
                        $("#" + input).on("keypress", function (event) {
                            var e = event || window.event;
                            var input = e.inputCode || e.which;

                            if (!CharIsNumber(input) || e.shiftinput || e.altinput || !e.ctrlinput) { e.returnValue = false; if (e.preventDefault) e.preventDefault(); }
                        });
                    }
                }
            }
        }
    }
}

function CheckAllInputs(ElmId, ShowErrorTimeout) {
    var Result = true;
    for (var input in window["forms"]["form1"].input) {
        if ($('#' + input).length > 0) {
            Result = Result & CheckInput($("#" + input), ShowErrorTimeout);
        }
    }
    return ((Result & CheckFormHasError(ElmId)) == 1) ? true : false;
}


function CheckFormHasError(ElmId) {
    $(document).find("[submit='" + "form1" + "']").show();
    $('#' + "form1" + 'success').hide();

    var Error = false;
    var Change;
    for (var input in window["forms"]["form1"].input) {
        if ($('#' + input).length > 0) {
            Error = Error | window["forms"]["form1"].input[$("#" + input).attr("id")].haserror;
            Change = Change | (window["forms"]["form1"].input[$('#' + input).attr("id")].oldvalue != $("#" + input).val() ? true :
            (false | !window["forms"]["form1"].input[$('#' + input).attr("id")].required));
            //  Change = Change | (window["forms"]["form1"].input[$('#' + input).attr("id")].oldvalue == $("#" + input).val() ? (false) : true);
            // alert((window["forms"]["form1"].input[$('#' + input).attr("id")].oldvalue == $("#" + input).val() ? (false | !window["forms"]["form1"].input[$('#' + input).attr("id")].required) : true));
            // alert(Change);
            //  Error = Error | Change;
        }
    }
    window.forms["form1"].setting.haserror = (!Change | Error) ? true : false;
    (!Change | Error) ? $(document).find("[submit='" + "form1" + "']").attr("disabled", "disabled") : $(document).find("[submit='" + "form1" + "']").removeAttr("disabled");
    return (!Change | Error) ? false : true;
}

function CheckInput(ElmId, ShowErrorTimeout) {
    if (window["forms"]["form1"].input[$(ElmId).attr("id")].required) {
        if ($(ElmId).val() == "" || $(ElmId).val().length < window["forms"]["form1"].input[$(ElmId).attr("id")].minlength) {
            window["forms"]["form1"].input[$(ElmId).attr("id")].haserror = true;
            if (ShowErrorTimeout != 1) {
                if (window[$(ElmId).attr("id") + "TimeoutError"] == (null || undefined)) {
                    window[$(ElmId).attr("id") + "TimeoutError"] = window.setTimeout(function () { SetInputError($(ElmId), "error_null_text"); }, ShowErrorTimeout);
                }
            }
            return false;
        }
        else {
            window["forms"]["form1"].input[$(ElmId).attr("id")].haserror = false;
            clearInterval(window[$(ElmId).attr("id") + "TimeoutError"]);
            window[$(ElmId).attr("id") + "TimeoutError"] = null;
            if ($(ElmId).parent().hasClass("state-error") || ShowErrorTimeout == 0) ResetInputError(ElmId, window["forms"]["form1"].input[$(ElmId).attr("id")].highlightsuccess);
            if (ShowErrorTimeout != 1) CheckAllInputs(ElmId, 1);
            return true;
        }
    }
    else {
        window["forms"]["form1"].input[$(ElmId).attr("id")].haserror = false;
        if (ShowErrorTimeout != 1) CheckAllInputs(ElmId, 1);
        return true;
    }
}


function SetInputError(ElmId, Error, ErrorAddOn) {
    window["forms"]["form1"].input[$(ElmId).attr("id")].haserror = true;
    $(ElmId).parent().removeClass("state-success");
    CheckFormHasError(ElmId);
    clearInterval(window[$(ElmId).attr("id") + "TimeoutError"]);
    window[$(ElmId).attr("id") + "TimeoutError"] = null; clearInterval(window[$(ElmId).attr("id") + "TimeoutSuccess"]);
    window[$(ElmId).attr("id") + "TimeoutSuccess"] = null;
    $(ElmId).parent().addClass("state-error");
    var ShowingTime = ($(ElmId).parent().parent().find("[for='" + $(ElmId).attr("id") + "']").is(":visible")) ? 0 : 200;
    $(ElmId).parent().parent().find("[for='" + $(ElmId).attr("id") + "']").remove();
    $(ElmId).parent().parent().append(EmInputError.replace("%for%", $(ElmId).attr("id")).replace("%message%",
    ((window["forms"]["form1"].input[$(ElmId).attr("id")][Error] != undefined) ? window["forms"]["form1"].input[$(ElmId).attr("id")][Error] : Error) + ((ErrorAddOn != undefined) ? "<br>" + ErrorAddOn : "")));
    $(ElmId).parent().parent().find("[for='" + $(ElmId).attr("id") + "']").show(ShowingTime);
}

function ResetInputError(ElmId, highlightsuccess) {
    $(ElmId).parent().parent().find("[for='" + $(ElmId).attr("id") + "']").hide(200);
    if (window[$(ElmId).attr("id") + "TimeoutError"] == null) {
        window[$(ElmId).attr("id") + "TimeoutSuccess"] = setTimeout(function () {
            $(ElmId).parent().addClass("state-success");
            $(ElmId).parent().removeClass("state-error");
        }, 200);
    }
    else {
        $(ElmId).parent().removeClass("state-error");
    }
}

function formsend(ElmId) {
    if (CheckAllInputs(ElmId, 0)) {
      //  $(ElmId).attr("disabled", "disabled");
        for (var input in window["forms"]["form1"].input) {
            if ($('#' + input).length > 0) {
                $("#" + input).attr("readonly", "readonly");
            }
        }
        if (!$('#' + "form1" + 'Loading').is(':visible')) {
            $('#' + "form1" + 'Loading').show(100);
            return false;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }
}

function formsended(ElmId) {

    $(ElmId).hide();
    $('#' + "form1" + 'success').find("span").html(window.forms["form1"].setting.success_text);
    $('#' + "form1" + 'success').show();
    $('#' + "form1" + 'Loading').hide(100);
}
