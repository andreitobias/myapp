$(function () {
  count = 0;
  wordsArray = ["Sales", "Subscriptions", "Results"];
  setInterval(function () {
    count++;
    $("#word").fadeOut(800, function () {
      $(this).text(wordsArray[count % wordsArray.length]).fadeIn(400);
    });
  }, 4000);
});