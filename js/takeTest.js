/**
 * Created by rixonmathew on 02/11/14.
 */
$(function(){
    clock = $('.clock').FlipClock({
        clockFace: 'MinuteCounter',
        countdown: true,
        autoStart: false
    });
    clock.setTime(300);
});

var clock;

function startTest(){
    clock.start();
    $("#testDetails").show();
}

function stopTest() {
    clock.stop();
    alert('Time is '+clock.timer.getElapsed());
}

function submitTest() {
    $('#sectionDetails').submit();
}