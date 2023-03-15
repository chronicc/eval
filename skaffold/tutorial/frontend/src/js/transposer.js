$(function () {
  var backendUrl = ""

  $.ajax({
    url: 'backend-url.env',
    async: false,
    success: function (response) {
      console.log(response)
      backendUrl = response
    }
  });

  $('#transposeSubmit').click(function () {
    var data = {}
    data["content"] = $('#inputField').val()
    console.log(data)
    var body = JSON.stringify(data)
    $.ajax({
      url: backendUrl,
      contentType: "application/json",
      data: body,
      dataType: "json",
      type: "POST",
      success: function (response) {
        console.log(response)
        $('#outputField').val(response)
      }
    });
  });
});
