Particle[] bob;
int opac;
void setup()
{
	opac = 255;
	size(500,500);
	background(0);
	bob = new Particle[501];
	for (int i=0; i<= 489; i++)
  	{
    bob[i] = new NormalParticle();
  	}
  	for (int i=490; i<= 499; i++)
  	{
    bob[i] = new OddballParticle();
  	}
  	bob[500] = new JumboParticle();
}
void draw()
{
	fill(0,0,0,opac);
	rect(0,0,500,500);
	noStroke();
	for (int i=0; i< bob.length; i++)
	{
	bob[i].move();
	bob[i].show();
	bob[i].mousePressed();
	}
}

class NormalParticle implements Particle
{
	int col;
	double myX, myY, speed, ang;
	NormalParticle()
	{
		myX = 250;
		myY = 250;
		speed = Math.random()*5;
		ang = Math.random()*2*Math.PI;
		col =color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		//color(0,mouseX/2,mouseY/2);
	}
	public void move()
	{
		if(myX<0)
		{
			myX=mouseX;
			myY=mouseY;
		}
		if(myX>500)
		{
			myX=mouseX;
			myY=mouseY;
		}
		if(myY<0)
		{
			myX=mouseX;
			myY=mouseY;
		}
		if(myY>500)
		{
			myX=mouseX;
			myY=mouseY;
		}
		myX = myX + Math.cos(ang)*speed;
		myY = myY + Math.sin(ang)*speed;

	}
	public void show()
	{
		fill(col);
		ellipse((float)myX,(float)myY,2,2);
	}
	public void mousePressed()
	{
		if (mousePressed == true)
		{
		opac = 20;
		}
		else
		{
		opac = 255;
		}
		if (mousePressed == true && speed<1)
		{
		speed = Math.random()*5;
		}
	}
}

interface Particle
{
	public void show();
	public void move();
	public void mousePressed();
}
class OddballParticle implements Particle
{
	int col;
	double myX, myY, speed, ang, bounceX, bounceY;
	boolean up, down, left, right;
	OddballParticle()
	{
		up = false;
		down = false;
		left = false;
		right = false;
		myX = 250;
		myY = 250;
		speed = Math.random()*5+2;
		ang = Math.random()*2*Math.PI;
		col =color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		bounceX = Math.cos(ang)*speed;
		bounceY = Math.sin(ang)*speed;
	}
	public void move()
	{

		if(myX<=0)
		{
			bounceX =  -bounceX;
		}
		if(myX>=500)
		{
			bounceX = -bounceX; 
		}
		if(myY<=0)
		{
			bounceY = -bounceY;
		}
		if(myY>=500)
		{
			bounceY = -bounceY;
		}

		myX = myX + bounceX;
		myY = myY + bounceY;	
		
	}
	public void show()
	{
		fill(col);
		ellipse((float)myX,(float)myY,10,10);

	}
	public void mousePressed()
	{
		if (mousePressed == true)
		{
		opac = 20;
		}
		else
		{
		opac = 255;
		}
		if (mousePressed == true && speed<1)
		{
		speed = Math.random()*5;
		}
	}
	//your code here
}
class JumboParticle extends OddballParticle
{
	JumboParticle()
	{
		speed = Math.random()*5 + 10;

	}
	public void show()
	{
		fill(col);
		ellipse((float)myX,(float)myY,35,35);

	}
}