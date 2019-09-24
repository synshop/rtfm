// omg thanks!! https://stackoverflow.com/a/17388962
$('.dropdown-submenu').click(function(){
    $('.dropdown-submenu > .dropdown-menu').css('display','none');
    $(this).children('.dropdown-menu').css('display','block');
    return false;
});
$('.dropdown-submenu >  .dropdown-menu a').click(function(){
    if ($(this).attr('href') != undefined && $(this).attr('href') != '') {
        window.location.href = $(this).attr('href');
    }
    return true;
});