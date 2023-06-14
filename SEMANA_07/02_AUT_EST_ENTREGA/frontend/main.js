let destruction = setInterval(destroy, 2000);
let time = 3;
let timeouts = [];

function destroy() {

    if(time === 3){
        $('.self_destroy').append(`ESSE CURRÍCULO VAI SE AUTODESTRUIR EM ${String(time)}`);
        timer(dots)
        return;
    };

    if(time > 0 && time < 3){
        let text = $('.self_destroy').text();
        $('.stop_btn').css({'visibility':'visible'});
        $('.self_destroy').text(text.substring(0, text.length - 4) + String(time));
        timer(dots)
    }
    else{
        $('body').hide();
        setTimeout(brinks, 2000);
        clearInterval(destruction);
    };

};

function timer(fun){
    time--;
    let first = setTimeout(fun, 500);
    let second = setTimeout(fun, 1000);
    let third = setTimeout(fun, 1500);
    timeouts = [first, second, third];
};

function dots(){
    $('.self_destroy').append('.');
};

function brinks(){

    $('.self_destroy').text('BRINKS!');
    $('.selfdestroy').css({'color':'green'});
    $('.stop_btn').remove();
    $('body').fadeIn(2000);
    setTimeout(function(){
        $('.self_destroy').remove();
    }, 3000);

};

$('.stop_btn').bind('click', save);

function save(){
    $('.self_destroy').hide();
    $('.stop_btn').remove();
    clearInterval(destruction);
    ajax_save();
};

function ajax_save(){
    const request = new XMLHttpRequest();
    request.open("GET", "save.txt", true);
    request.send();
    request.onreadystatechange = function(){
        if(request.readyState === 4 && request.status === 200){
            $('.self_destroy').text(request.responseText);
            for(let i = 0; i < timeouts.length; i++){
                clearTimeout(timeouts[i]);
            };
            $('.self_destroy').fadeIn(2000);
            setTimeout(function(){
                $('.self_destroy').remove();
            }, 5000);
        };
    };
};
