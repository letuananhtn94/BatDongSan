function setEventToControl() {
    $("#ddlProvince").on("change", function () {
        $("#Lat").val("");
        $("#Long").val("");
        $('#ddlDistrict').select2('val', null);
        GetListPhuongToSelectBox($(this).val(), "ddlProvince");
    });
}

$(document).ready(function () {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        setEventToControl();// Gán event sau khi postback                       
    });
    setEventToControl();// Gán event
});

// Lấy danh sách phường theo quận gán vào select
function GetListPhuongToSelectBox(data, element) {
    $.ajax({
        type: "POST",
        url: '@Url.Action("GetDistrictByID", "Home")' + "?id=" + data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //data:JSON.stringify($("#ddlQuan").val()),
        async: false,
        success: function (data) {
            $('#' + element).find('option').remove();
            $('#' + element).append($("<option></option>").attr("value", "").text("--Chọn Quận/Huyện--"));
            $.each(data, function () {
                $('#' + element).append($("<option></option>").attr("value", this.ID).text(this.Name));
            });
        },
        error: function (a) {
            console.log(a.responseText);
        }
    });
}
