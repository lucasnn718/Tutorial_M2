let destruction = setInterval(destroy, 2000)
let time = 3

function destroy() {

    if(time === 3){ 
        $('.self_destroy').append(`ESSE CURRÍCULO VAI SE AUTODESTRUIR EM ${String(time)}`);
        timer(dots)
        return;
    };

    if(time > 0 && time < 3){
        let text = $('.self_destroy').text();
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
    setTimeout(fun, 500);
    setTimeout(fun, 1000);
    setTimeout(fun, 1500);
}

function dots(){

    $('.self_destroy').append('.')
    
};

function brinks(){

    $('.self_destroy').text('BRINKS!')
    $('.selfdestroy').css({'color':'green'})
    $('body').fadeIn(2000)
    setTimeout(function(){
        $('.self_destroy').remove();
    }, 3000);

};