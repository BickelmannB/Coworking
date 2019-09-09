
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



// ---------------- OR -----------------

// $("#tri").on("change", function(){
//   $(this).closest("form").submit();
// });

// ------------------------------------



