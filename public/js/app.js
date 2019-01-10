var menu = document.getElementById('menu');
menu.addEventListener('click', function() {
    var nav = document.getElementById('rnav');
    nav.style.height = (nav.style.height == "auto" ? "0" : "auto");
}, false);