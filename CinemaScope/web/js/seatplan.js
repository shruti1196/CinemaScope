var s = new Array(259);


for(var x=0; x<=258; x++)
{
    s[x]=0;
}

var a = "seat";
function func1(seatno)
{
    var c = a.concat(seatno);
    if(s[seatno] === 0)
    {
        s[seatno]=1;
        document.getElementById(c).src = "images/seat_selected.png";
        document.getElementById("s"+seatno).value = "yes";
    }
    else if(s[seatno] === 1)
    {
        s[seatno]=0;
        document.getElementById(c).src = "images/seat_platinum.png";
        document.getElementById("s"+seatno).value = "no";
    }
}

function func2(seatno)
{
    var c = a.concat(seatno);
    if(s[seatno] === 0)
    {
        s[seatno]=1;
        document.getElementById(c).src = "images/seat_selected.png";
        document.getElementById("s"+seatno).value = "yes";
    }
    else if(s[seatno] === 1)
    {
        s[seatno]=0;
        document.getElementById(c).src = "images/seat_gold.png";
        document.getElementById("s"+seatno).value = "no";
    }
}

function func3(seatno)
{
    var c = a.concat(seatno);
    if(s[seatno] === 0)
    {
        s[seatno]=1;
        document.getElementById(c).src = "images/seat_selected.png";
        document.getElementById("s"+seatno).value = "yes";
    }
    else if(s[seatno] === 1)
    {
        s[seatno]=0;
        document.getElementById(c).src = "images/seat_silver.png";
        document.getElementById("s"+seatno).value = "no";
    }
}

