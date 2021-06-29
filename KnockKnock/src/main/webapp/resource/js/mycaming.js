$.each(function(){
	var ciEndDate = $(".enddate").index(e);
    CountDownTimer(ciEndDate, 'countdown');
});


function CountDownTimer(dt, className){
    var end = new Date(dt);

    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;

    function showRemaining(){
        var now = new Date();
        var distance = end - now;
        if ( distance < 0) {
            clearInterval(timer);
            document.getElementsByClassName("countdown").innerHTML = '디데이~'
            return;
        }
        var days = Math.floor(distance / _day);
        var hour = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance%_minute) / _second);

        document.getElementsByClassName("countdown").innerHTML = days+'일' + hour +'시간' + minutes +'분'+seconds+'초';

    }
    timer = setInterval(showRemaining, 1000);
}