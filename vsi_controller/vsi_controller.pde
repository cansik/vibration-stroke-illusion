
String mcuPort = "/dev/tty.SLAB_USBtoUART";

MicroController mcu = new MicroController(this, mcuPort);

VibrationDevice[] devices = new VibrationDevice[] {
  new VibrationDevice(mcu, 0, 100, 100)
};

VibrationPattern[] patterns = new VibrationPattern[] {
  new NoVibrationPattern(devices), 
  new BasicVibrationPattern(devices), 
};

PFont font;

PGraphics canvas;

int currentPatternIndex = 0;

void setup()
{
  size(1024, 768, FX2D);
  //fullScreen(FX2D);

  font = createFont("Helvetica", 32);

  canvas = createGraphics((int)(width * 0.8), (int)(height * 0.7));
  canvas.pixelDensity = 2;

  // attach mcu
  if (!mcu.attach())
  {
    println("could not attach mcu!");
  }
}

void draw()
{
  background(255);

  if (frameCount < 1)
    return;

  // run pattern
  patterns[currentPatternIndex].update();

  // render canvas
  canvas.beginDraw();
  canvas.background(200);
  canvas.textFont(font);

  // update and render devices
  for (VibrationDevice device : devices)
  {
    device.update();
    device.render(canvas);
  }

  canvas.endDraw();

  // add canvas
  image(canvas, (width / 2) - (canvas.width / 2), (height / 2) - (canvas.height / 2));

  // render info text
  fill(55);
  textSize(20);
  text("Vibration Stroke Illusion", 30, 40);

  textSize(14);
  text("ZHdK - 2018 | " + patterns[currentPatternIndex].name, 30, 65);
}

void keyPressed()
{
  switch(key)
  {
  case 'C': 
    // try to connect
    if (mcu.attach())
    {
      println("mcu attached!");
    } else
    {
      println("could not attach mcu!");
    }
    break;

  case 'D':
    mcu.detach();
    println("mcu detached!");
    break;

  case 'P':
    currentPatternIndex = constrain(currentPatternIndex + 1, 0, patterns.length - 1);
    break;

  case 'O':
    currentPatternIndex = constrain(currentPatternIndex - 1, 0, patterns.length - 1);
    break;
  }
}
