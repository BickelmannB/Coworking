  // $( function() {
  //   $( "#query" ).autocomplete({
  //     source: function( request, response ) {
  //       $.ajax( {
  //         url: "/users/user_adress?query=" + request.term ,
  //         dataType: "jsonp",
  //         data: {
  //           term: request.term
  //         },
  //         success: function( data ) {
  //           response( data );
  //         }
  //       } );
  //     },
  //     minLength: 2,
  //   } );
  // } );

// $(function() {

//     $("#query").autocomplete({
//         source: function(request, response) {
//             $.ajax({
//                 url: "https://api-adresse.data.gouv.fr/search/?q=" + request.term,
//                 dataType: "json",
//                 data: {
//                     term: request.term
//                 },
//                 success: function(data) {
//                   var resp = (data.features);
//                   resp.forEach(function(feature) {
//                     response(feature.properties.label);
//                   });
//                 }
//             });
//         },
//         minLength: 2,
//     });
// });

var service_url = "https://api-adresse.data.gouv.fr/search/";
$('#searchAdresse').autocomplete({
    source: function (request, response) {
        $.getJSON(service_url + "?q=" + request.term, function (result) {
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
        // $('#content').find("input[name*='appartement_etage_couloir']").val('');
        // $('#content').find("input[name*='complement_identification_bat']").val('');
        // if (ui.item.data.street && ui.item.data.housenumber) {
        // $('#content').find("input[name*='numero_et_libelle_de_voie']").val(ui.item.data.housenumber + ' ' + ui.item.data.street) ;
        // }
        // else
        // {
        //     $('#content').find("input[name*='numero_et_libelle_de_voie']").val(ui.item.data.name) ;
        // }
        // $('#content').find("input[name*='complement_adresse']").val(''); // Complément adresse
        // $('#content').find("input[name*='code_postal']").val(ui.item.data.postcode);
        // $('#content').find("input[name*='ville']").val(ui.item.data.city);
        // $('#content').find("input[name*='pay']").val('FRANCE');
    }
});
