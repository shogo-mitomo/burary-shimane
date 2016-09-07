$ ->
  $("#spot_name_field").autocomplete
    source: (req, res) ->
      $.ajax
        url: "/answers/autocomplete_name/" + encodeURIComponent(req.term) + ".json",
        dataType: "json",
        success: (data) ->
          res(data)
    ,
    autoFocus: true,
    delay: 300,
    minLength: 2