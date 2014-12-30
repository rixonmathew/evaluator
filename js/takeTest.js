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
                if (time==30) {
                    alert('Last 30 seconds remaining. Test will be auto submitted at the end.');
                }
                if (time==0) {
                    $('#sectionDetails *').attr('readonly', 'true');
                    $('#sectionDetails').submit();
                }
            }

        }
    });

    clock.setTime($("#timeForTest").val());

    $('#sectionDetails').submit(function() {
        var c = confirm("Are you sure you want to submit ?");
        return c;
    });

});


function startTest(){
    clock.start();
    $("#testDetails").show();
}

function stopTest() {
    clock.stop();
    alert('Time is '+clock.timer.getElapsed());
}

function resetForm(){
    $('#sectionDetails').reset();
    $('#sectionDetails *').attr('readonly', 'false');
}

function flipAudioLanguage(langauge) {
    //alert('change audio language was clicked '+langauge);
    var audio = $("#audio_question_1");
    var newUrl;
    if (langauge=='hindi') {
        newUrl='media/audio_hindi.mp3';
    } else if (langauge=='marathi') {
        newUrl='media/audio_marathi.mp3';
    }
    $("#audio_file_1").attr("src", newUrl);
    /****************/
    audio[0].pause();
    audio[0].load();//suspends and restores all audio element
    //audio[0].play();
    /****************/
}