class Firework
{
  float posx, posy, posz, t0, t1, t2, v0, r, g, b, firstcolor, transparency, X, Y, Z;
  float[] theta1=new float[2000];
  float[] theta2=new float[2000];
  float[] v1=new float[2000];
  float[] Vx=new float[2000];
  float[] Vy=new float[2000];
  float[] Vz=new float[2000];
  float[] red=new float[2000];
  float[] green=new float[2000];
  float[] blue=new float[2000];
  float[] gravity=new float[2000];
  float[] radius=new float[20];
  float[] XX=new float[20];
  float[] YY=new float[20];
  float[] ZZ=new float[20];


  Firework(float posx, float posy, float posz, float t1, float v0)
  {
    this.posx=posx;
    this.posy=posy;
    this.posz=posz;
    this.t1=t1;
    this.v0=v0;
    this.firstcolor=255;
    this.transparency=255;
    this.r=(float)random(50, 256);
    this.g=(float)random(50, 256);
    this.b=(float)random(50, 256);
    for (int i=0; i<2000; i++)
    {
      this.theta1[i]=random(360);
      this.theta2[i]=random(360);
      this.v1[i]=(float)random(70);
      //x座標の位置
      this.Vx[i]=v1[i]*cos(radians(theta1[i]))*sin(radians(theta2[i]));
      //y座標の位置
      this.Vy[i]=v1[i]*sin(radians(theta1[i]))*sin(radians(theta2[i]));
      //z座標の位置
      this.Vz[i]=v1[i]*cos(radians(theta2[i]));
      //重力
      this.gravity[i]=(float)random(50, 75);
      if (v1[i]<15)
      {
        this.red[i]=r;
        this.green[i]=g;
        this.blue[i]=b;
      } else
      {
        this.red[i]=r+30;
        this.green[i]=g-50;
        this.blue[i]=b-50;
      }
    }
    radius[0]=8.0;
  }

  void fire()
  {
    t1+=0.05;
    if (v0-9.8*t1>0)
    {
      //打ち出した花火玉の関数
      posx=posx+(float)random(-1, 1);
      posy=-v0*t1+0.5*9.8*t1*t1;
      posz=posz+(float)random(-1, 1);
      int i=19;
      while (i>0)
      {
        XX[i]=XX[i-1];
        YY[i]=YY[i-1];
        ZZ[i]=ZZ[i-1];
        i--;
      }
      XX[0]=posx;
      YY[0]=posy;
      ZZ[0]=posz;
      i=0;
      //花火玉
      firstcolor-=4;
      transparency-=4;
      while (i<20)
      {
        if (YY[i]<0)
        {
          radius[i]=radius[0]-0.4*i;
          stroke(firstcolor, transparency);
          strokeWeight(radius[i]);
          point(XX[i], YY[i], ZZ[i]);
        }
        i++;
      }
    } else
    {
      t0+=0.08;
      for (int i=0; i<2000; i++)
      {
        t2=0.6*(log(t0)+2);
        X=posx+Vx[i]*t2;
        Y=posy-Vy[i]*t2+0.5*gravity[i]*t2*t2;
        Z=posz+Vz[i]*t2;
        if (t0>3)
        {
          red[i]-=2;
          green[i]-=2;
          blue[i]-=2;
        }
        if (red[i]>0||green[i]>0||blue[i]>0)
        {
          strokeWeight(2);
          stroke(red[i], green[i], blue[i]);
          point(X, Y, Z);
        }
      }
    }
  }
}
