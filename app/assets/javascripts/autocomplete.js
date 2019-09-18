
var service_url = "/users/user_adress";
$('#searchAdresse').autocomplete({
    source: function (request, response) {
        $.getJSON(service_url + "?query=" + request.term, function (result) {
            response($.map(result.features, function(item)
            {
                return { value: item.properties.label,
                data: item.properties,
                geo: item.geometry
                       };
            }));
        });
    },
    minLength: 2,
    select: function (event, ui) {
        $("#address_zip").val( ui.item.data.postcode );
        $("#address_street").val( ui.item.data.street );
        $("#address_n").val( ui.item.data.housenumber);
        $("#address_city").val( ui.item.data.city);
    }
});
