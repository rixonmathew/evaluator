/**
 * Created by rixonmathew on 02/11/14.
 */
$(function(){

    clock = $('.clock').FlipClock({
        clockFace: 'MinuteCounter'
    });
    clock.stop();

});

var clock;

function startTest(){
    clock.start();
}

function stopTest() {
    clock.stop();
    alert('Time is '+clock.timer.getElapsed());
}