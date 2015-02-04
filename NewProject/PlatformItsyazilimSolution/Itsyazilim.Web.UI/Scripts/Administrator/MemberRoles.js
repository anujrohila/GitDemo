
function DeleteModuleRoleMappingGrid(id) {
    var confirmResult = confirm(ItsyazilimWebResources.msgConfirmDelete);
    var callUrl = $("#webUrl").val() + "/Administrator/DeleteModuleRoleMapping";
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
                    RefreshGrid("ListAllModuleRoleMappingGrid");
                }
                else {
                    alert(result.Message);
                }
            }
        });
    }
}