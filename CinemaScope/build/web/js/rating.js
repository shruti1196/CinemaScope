var a=0, b=0, c=0, d=0, e=0;

 function func1() {
	if(a==0)
	{
		if(b==0 && c==0 && d==0 && e==0)
		{
			a=1;
			document.getElementById("heart1").src = "images/heart_filled.png";
		}
	}
	else if(a==1)
	{
		if(b==0 && c==0 && d==0 && e==0)
		{
			a=0;
			document.getElementById("heart1").src = "images/heart_empty.png";
		}
		else
		{
			b=0; c=0; d=0; e=0;
			document.getElementById("heart2").src = "images/heart_empty.png";
			document.getElementById("heart3").src = "images/heart_empty.png";
			document.getElementById("heart4").src = "images/heart_empty.png";
			document.getElementById("heart5").src = "images/heart_empty.png";
		}
	}
        document.getElementById("rate").value = a+b+c+d+e;
 }
 
 function func2() {
	if(a==0 && b==0)
	{
		if(c==0 && d==0 && e==0)
		{
			a=1; b=1;
			document.getElementById("heart1").src = "images/heart_filled.png";
			document.getElementById("heart2").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==0)
	{
		if(c==0 && d==0 && e==0)
		{
			b=1;
			document.getElementById("heart2").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==1)
	{
		if(c==0 && d==0 && e==0)
		{
			b=0;
			document.getElementById("heart2").src = "images/heart_empty.png";
		}
		else
		{
			c=0; d=0; e=0;
			document.getElementById("heart3").src = "images/heart_empty.png";
			document.getElementById("heart4").src = "images/heart_empty.png";
			document.getElementById("heart5").src = "images/heart_empty.png";
		}
	}
        document.getElementById("rate").value = a+b+c+d+e;
 }
 
 function func3() {
	if(a==0 && b==0 && c==0)
	{
		if(d==0 && e==0)
		{
			a=1; b=1; c=1;
			document.getElementById("heart1").src = "images/heart_filled.png";
			document.getElementById("heart2").src = "images/heart_filled.png";
			document.getElementById("heart3").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==0 && c==0)
	{
		if(d==0 && e==0)
		{
			b=1; c=1;
			document.getElementById("heart2").src = "images/heart_filled.png";
			document.getElementById("heart3").src = "images/heart_filled.png";	 
		}
	}
	else if(a==1 && b==1 && c==0)
	{
		if(d==0 && e==0)
		{
			c=1;
			document.getElementById("heart3").src = "images/heart_filled.png";	 
		}
	}
	else if(a==1 && b==1 && c==1)
	{
		if(d==0 && e==0)
		{
			c=0;
			document.getElementById("heart3").src = "images/heart_empty.png";	 
		}
		else
		{
			d=0; e=0;
			document.getElementById("heart4").src = "images/heart_empty.png";	
			document.getElementById("heart5").src = "images/heart_empty.png";	
		}
	}
        document.getElementById("rate").value = a+b+c+d+e;
 }	
 
 function func4() {
	if(a==0 && b==0 && c==0 && d==0)
	{
		if(e==0)
		{
			a=1; b=1; c=1; d=1;
			document.getElementById("heart1").src = "images/heart_filled.png";
			document.getElementById("heart2").src = "images/heart_filled.png";
			document.getElementById("heart3").src = "images/heart_filled.png";
			document.getElementById("heart4").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==0 && c==0 && d==0)
	{
		if(e==0)
		{
			b=1; c=1; d=1;
			document.getElementById("heart2").src = "images/heart_filled.png";
			document.getElementById("heart3").src = "images/heart_filled.png";
			document.getElementById("heart4").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==1 && c==0 && d==0)
	{
		if(e==0)
		{
			c=1; d=1;
			document.getElementById("heart3").src = "images/heart_filled.png";
			document.getElementById("heart4").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==1 && c==1 && d==0)
	{
		if(e==0)
		{
			d=1;
			document.getElementById("heart4").src = "images/heart_filled.png";
		}
	}
	else if(a==1 && b==1 && c==1 && d==1)
	{
		if(e==0)
		{
			d=0;
			document.getElementById("heart4").src = "images/heart_empty.png";	 
		}
		else
		{
			e=0;
			document.getElementById("heart5").src = "images/heart_empty.png";	
		}
	}
        document.getElementById("rate").value = a+b+c+d+e;
 }	
 
  function func5() {
	if(a==0 && b==0 && c==0 && d==0 && e==0)
	{
		a=1; b=1; c=1; d=1; e=1;
		document.getElementById("heart1").src = "images/heart_filled.png";
		document.getElementById("heart2").src = "images/heart_filled.png";
		document.getElementById("heart3").src = "images/heart_filled.png";
		document.getElementById("heart4").src = "images/heart_filled.png";
		document.getElementById("heart5").src = "images/heart_filled.png";
	}
	else if(a==1 && b==0 && c==0 && d==0 && e==0)
	{
		b=1; c=1; d=1; e=1;
		document.getElementById("heart2").src = "images/heart_filled.png";
		document.getElementById("heart3").src = "images/heart_filled.png";
		document.getElementById("heart4").src = "images/heart_filled.png";
		document.getElementById("heart5").src = "images/heart_filled.png";
	}
	else if(a==1 && b==1 && c==0 && d==0 && e==0)
	{
		c=1; d=1; e=1;
		document.getElementById("heart3").src = "images/heart_filled.png";
		document.getElementById("heart4").src = "images/heart_filled.png";
		document.getElementById("heart5").src = "images/heart_filled.png";
	}
	else if(a==1 && b==1 && c==1 && d==0 && e==0)
	{
		d=1; e=1;
		document.getElementById("heart4").src = "images/heart_filled.png";
		document.getElementById("heart5").src = "images/heart_filled.png";
	}
	else if(a==1 && b==1 && c==1 && d==1 && e==0)
	{
		e=1;
		document.getElementById("heart5").src = "images/heart_filled.png";
	}
	else if(a==1 && b==1 && c==1 && d==1 && e==1)
	{
		e=0;
		document.getElementById("heart5").src = "images/heart_empty.png";
	}
        document.getElementById("rate").value = a+b+c+d+e;
  }	
 

 
 