$(function () {
  $(document).on("mouseover", "#tiped-title-contents-distributer", function () {
    $(this).css({ "color": "purple","border-bottom": "1px solid" });
  }).on("mouseout", "#tiped-title-contents-distributer", function () {
    $(this).css({ "color": "", "border-bottom": "none" });
  })

  $(document).on("mouseover", "#tip-show-contributer", function () {
    $(this).css({ "color": "purple","border-bottom": "1px solid" });
  }).on("mouseout", "#tip-show-contributer", function () {
    $(this).css({ "color": "", "border-bottom": "none" });
  })
});