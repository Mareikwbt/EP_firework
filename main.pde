ArrayList<Firework> firework;
CameraControl control; // カメラ操作
float click=0;
int kakuritu=1;
float n=20;

void setup()
{
  fullScreen(P3D);
  //花火
  firework=new ArrayList<Firework>();
  //カメラ
  control =new CameraControl(this);
}
void draw()
{
  background(0);
  directionalLight(255, 255, 255, -1000, -1000, -1000);
  translate(displayWidth/2, displayHeight/2, 0 );
  if (click%2==1)
  {
    kakuritu=(int)random(n);
  }
  if (kakuritu==0)
  {
    firework.add(new Firework(random(-400, 400), -400, random(-400, 400), 0, random(80, 150)));
  }
  for (int i=0; i<firework.size(); i++)
  {
    firework.get(i).fire();
  }

  // 床
  perspective();
  strokeWeight(1);
  stroke(255, 255, 255, 100);
  for (int x=-400; x<=400; x+=50) {

    line( x, 0, -400, x, 0, 400 );
  }
  for (int z=-400; z<=400; z+=50) {


    line( -400, 0, z, 400, 0, z );
  }
  //カメラの説明
  pushMatrix();
  translate(-displayWidth/2.0, -displayHeight/2.0);
  hint(DISABLE_DEPTH_TEST);
  fill(255);
  text("[UP],[DOWN] : Tilt up/down", 10, 20);
  text("[LEFT],[RIGHT] : Pan left/right", 10, 35);
  text("[w],[s] : Move forward/backward", 10, 50);
  text("[a],[d] : Move left/right", 10, 65 );
  text("[e],[c] : Move up/down", 10, 80 );
  hint(ENABLE_DEPTH_TEST);
  popMatrix();
  //月
  translate(-400, -800, -400);
  fill(255, 255, 0);
  noStroke();
  sphere(50);
}
void keyPressed()
{
  if(key==' ')
  {
    click++;
  }
  if(key=='1')
  {
    n++;
  }
  if(key=='2')
  {
    n--;
  }
}
