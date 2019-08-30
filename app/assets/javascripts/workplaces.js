// var tri = $('#tri');
// tri.change(function() {
// tri.closest("form").submit();
// ;})

// const tri = document.getElementById("tri");
// tri.addEventListener("change", function() {
// $(this).closest("form").submit();
// });

$("#tri").on("change", function(){
  $(this).closest("form").submit();
});
