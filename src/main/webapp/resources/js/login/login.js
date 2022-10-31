/**
 * 
 */
 
 //개인정보수집이용동의
$(".loginBtn").click(function(){
  $(".popup_bg00").stop().fadeIn();
  $(".popup00.personal_pop00").stop().fadeIn();
  $("body").addClass("bg_g");
});

  $(".popup_bg00").on("click", onPopClose);
  $(".x_btn00").on("click", onPopClose);

function onPopClose() {
  $(".popup_bg00").stop().fadeOut();
  $(".popup00.personal_pop00").stop().fadeOut();
  $("body").removeClass("bg_g");
}