
String mcuPort = "/dev/tty.SLAB_USBtoUART";

MicroController mcu = new MicroController(this, mcuPort);

VibrationDevice[] devices = new VibrationDevice[] {
  new VibrationDevice(mcu, 0, 100, 100)
};

PFont font;

PGraphics canvas;

void setup()
{
  size(1024, 768, FX2D);
  //fullScreen(FX2D);

  font = createFont("Helvetica", 32);

  canvas = createGraphics((int)(width * 0.8), (int)(height * 0.7));
  canvas.pixelDensity = 2;
}

void draw()
{
  background(255);

  if (frameCount < 1)
    return;

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

  // render canvas
  image(canvas, (width / 2) - (canvas.width / 2), (height / 2) - (canvas.height / 2));

  // render info text
  fill(55);
  textSize(20);
  text("Vibration Stroke Illusion", 30, 40);

  textSize(14);
  text("ZHdK - 2018", 30, 65);
}
