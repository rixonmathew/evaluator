/**
 * Created by rixonmathew on 02/11/14.
 */
var clock;

$(function(){
    clock = $('.clock').FlipClock({
        clockFace: 'MinuteCounter',
        countdown: true,
        autoStart: false,
        callbacks: {
            interval:function() {
                var time = clock.getTime().time;
                if (time==0) {
                    //TODO add call here to display alert when last 30 seconds are remaining. and to disable any
                    //more edits when time elapsed is 0.
                }
            }

        }
    });
    clock.setTime($("#timeForTest").val());
});


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