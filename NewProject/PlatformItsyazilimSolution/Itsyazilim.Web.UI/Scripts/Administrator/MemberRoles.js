
function DeleteModuleRoleMappingGrid(id) {
    var confirmResult = confirm(ItsyazilimWebResources.msgConfirmDelete);
    var callUrl = $("#webUrl").val() + "/Administrator/DeleteMemberRoleMapping";
    var dataToSend = { moduleRoleMappingId: id };
    if (confirmResult) {
        $.ajax({
            url: callUrl,
            type: "POST",
            data: dataToSend,
            cache: false,
            success: function (result) {
                if (result.Success == true) {
                    alert(result.Message);
                    RefreshGrid("ListAllMemberRoleMappingGrid");
                }
                else {
                    alert(result.Message);
                }
            }
        });
    }
}