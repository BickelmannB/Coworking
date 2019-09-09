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

  $( function() {

    $( "#query" ).autocomplete({
      source: function( request, response ) {
        $.ajax( {
          url: "/users/user_adress?query=" + request.term ,
          dataType: "jsonp",
          data: {
            term: request.term
          },
          success: function( data ) {
            response( data );
          }
        } );
      },
      minLength: 2,
    } );
  } );
