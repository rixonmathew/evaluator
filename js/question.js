$(function(){
    $("#questionDetails").submit(function( event ) {
        $("#operation").val('insert');
        $("#questionAttributes").val($("#attributesDiv").text());
    });
});