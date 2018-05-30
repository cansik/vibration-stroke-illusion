class VibrationDevice
{
  MicroController mcu;
  int pin;
  float x;
  float y;

  public VibrationDevice(MicroController mcu, int pin, float x, float y)
  {
    this.mcu = mcu;
    this.pin = pin;
    this.x = x;
    this.y = y;
  }

  public void update()
  {
  }

  public void render(PGraphics pg)
  {
    pg.pushMatrix();
    pg.translate(x, y);
    pg.noFill();
    pg.stroke(55);
    pg.strokeWeight(3);
    pg.ellipse(0, 0, 50, 50);
    pg.popMatrix();
  }
}
