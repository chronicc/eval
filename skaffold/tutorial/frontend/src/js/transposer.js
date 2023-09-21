$(function () {
  var backendUrl = ""

  $.ajax({
    url: '.env',
    async: false,
    success: function (response) {
      envvars = response.split('\n')
      environment = {}
      envvars.forEach(v => {
        kvp = v.split("=")
        environment[kvp[0]] = kvp[1]
      });
      console.log(environment)
      backendUrl = environment["BACKEND_URL"]
    }
  });

  $('#transposeSubmit').click(function () {
    var data = {}
    data["content"] = $('#inputField').val()
    console.log(data)
    var body = JSON.stringify(data)
    $.ajax({
      url: backendUrl + '/reverse',
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
