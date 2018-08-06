/**
 * Created by Huhangnet on 2016/5/4.
 */
var huhangnet = new function(){
    this.init = function(){

        /* 宽高比 */
        $('[hh-wh]').each(function(){
            var w = parseInt($(this).width()*parseFloat($(this).attr('hh-wh')));
            $(this).height(parseInt(w));
        })
        /*限制最大宽*/
        $('[hh-max-width] img,[hh-max-width] div,[hh-max-width] iframe').each(function(){
            $(this).css({'maxWidth':"100%",'height':'auto'});
        })

    }
}

$(function(){

    huhangnet.init();
    window.addEventListener("resize", function(){
        huhangnet.init();
    })
})