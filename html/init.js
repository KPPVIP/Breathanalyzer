
var rangeDecimals = 1;

$(document).ready(function(){
    window.addEventListener('message', function(event) {

        if (event.data.action == 'open') {
            $('#alko').show();
            $('#result').text("BEREIT");
        } else if (event.data.action == 'close') {
            $('#alko').hide();
        } 
		
        $('#result').text(event.data.result);
        $('#mgprol').text(event.data.mgprol);
     
    });
});


