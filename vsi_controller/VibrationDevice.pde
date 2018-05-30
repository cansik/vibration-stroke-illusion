class VibrationDevice
{
  MicroController mcu;
  int pin;
  float x;
  float y;

  float currentStrength = 0f;

  public VibrationDevice(MicroController mcu, int pin, float x, float y)
  {
    this.mcu = mcu;
    this.pin = pin;
    this.x = x;
    this.y = y;
  }

  public void write(float strength)
  {
    currentStrength = strength;
    mcu.writeStrength(pin, strength);
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
    pg.ellipseMode(CENTER);
    pg.ellipse(0, 0, 50, 50);

    pg.fill(55);
    pg.textAlign(CENTER, CENTER);
    pg.textSize(20);
    pg.text(nf(pin, 2), 0, 0);

    // render vibration
    float vd = map(currentStrength, 0, 1, 0, 5);
    float vx = random(-vd, vd);
    float vy = random(-vd, vd);

    pg.noFill();
    pg.stroke(255, 0, 0, 150);
    //pg.stroke(55, 100);
    pg.strokeWeight(3);
    pg.ellipseMode(CENTER);

    if (currentStrength > 0)
      pg.ellipse(vx, vy, 50, 50);

    pg.popMatrix();
  }
}
