// JavaScript Document
var x;
var y;

function changequestion(question) {
    document.getElementById('hiddenquestion ' + question).value = document.getElementById('qestion ' + question).value;
}

function changeletter(letter) {
    document.getElementById('hiddenletter ' + letter).value = document.getElementById('letter ' + letter).value;
}

function changearrow(number, arrow) {
    document.getElementById('div ' + number).style.backgroundImage = 'url(resources/static/images/arrows/' + arrow + ')';
    document.getElementById('table ' + number).style.display = 'none';
    document.getElementById('TB_overlay').style.display = 'none';
    switch (arrow) {
        case '00.png' :
            document.getElementById('hiddenarrow ' + number).value = '0';
            break;
        case '01.png' :
            document.getElementById('hiddenarrow ' + number).value = '1';
            break;
        case '02.png' :
            document.getElementById('hiddenarrow ' + number).value = '2';
            break;
        case '03.png' :
            document.getElementById('hiddenarrow ' + number).value = '3';
            break;
        case '04.png' :
            document.getElementById('hiddenarrow ' + number).value = '4';
            break;
        case '05.png' :
            document.getElementById('hiddenarrow ' + number).value = '5';
            break;
        case '06.png' :
            document.getElementById('hiddenarrow ' + number).value = '6';
            break;
        case '07.png' :
            document.getElementById('hiddenarrow ' + number).value = '7';
            break;
        case '08.png' :
            document.getElementById('hiddenarrow ' + number).value = '8';
            break;
        case '09.png' :
            document.getElementById('hiddenarrow ' + number).value = '9';
            break;
        case '10.png' :
            document.getElementById('hiddenarrow ' + number).value = '10';
            break;
        case '11.png' :
            document.getElementById('hiddenarrow ' + number).value = '11';
            break;
        case '12.png' :
            document.getElementById('hiddenarrow ' + number).value = '12';
            break;
        case '13.png' :
            document.getElementById('hiddenarrow ' + number).value = '13';
            break;
        case '14.png' :
            document.getElementById('hiddenarrow ' + number).value = '14';
            break;
    }
}

function select(td){
    "use strict";
    x = event.pageX;
    y = event.pageY;
    document.getElementById('selectDiv ' + td).style.left = x;
    document.getElementById('selectDiv ' + td).style.top = y;
    document.getElementById('selectDiv ' + td).style.display = 'block';
    document.getElementById('TB_overlay').style.display = 'block';
}

function changeSelect(div) {
    "use strict";
    document.getElementById('selectDiv ' + div).style.display = 'none';
    var ourselect = document.getElementById('select ' + div);
    if (ourselect.value == 0) {
        document.getElementById('letter ' + div).style.display = 'none';
        document.getElementById('qestion ' + div).style.display = 'none';
        document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/00.png)';
        document.getElementById('TB_overlay').style.display = 'none';
    }
    if (ourselect.value == 1) {
        document.getElementById('letter ' + div).style.display = 'block';
        document.getElementById('qestion ' + div).style.display = 'none';
        document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/00.png)';
        document.getElementById('TB_overlay').style.display = 'none';
    }
    if (ourselect.value == 2) {
        document.getElementById('letter ' + div).style.display = 'block';
        document.getElementById('qestion ' + div).style.display = 'none';
        document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/01.png)';
        document.getElementById('table ' + div).style.left = x;
        document.getElementById('table ' + div).style.top = y;
        document.getElementById('table ' + div).style.display = 'block';
    }
    if (ourselect.value == 3) {
        document.getElementById('letter ' + div).style.display = 'none';
        document.getElementById('qestion ' + div).style.display = 'block';
        document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/00.png)';
        document.getElementById('TB_overlay').style.display = 'none';
    }
}