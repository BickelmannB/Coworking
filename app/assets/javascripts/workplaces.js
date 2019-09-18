
// ---------- Event change on select for sort results -------

const tri = document.getElementById("tri");
if (tri) {
tri.addEventListener("change", function() {
$(this).closest("form").submit();
});
tri.addEventListener("mouseover", function() {
$(this).show;
});
  tri.addEventListener("mouseout", function() {
$(this).hide;
});
};

url = "workplaces/load_wp";
$("#form").on("submit", function(ev) {
              ev.preventDefault();
            ev.stopImmediatePropagation();
            ev.stopPropagation();
var tri = $("#tri").val();
var search = $("#search").val();
$("#wp").load(url + "?utf8=✓&search=" + search + "&tri=" + tri);
});

  $( function() {
    $( "#resastart" ).datepicker();
    $( "#resaend" ).datepicker();
  } );
// ---------------- OR -----------------

// $("#tri").on("change", function(){
//   $(this).closest("form").submit();
// });

// ------------------------------------



