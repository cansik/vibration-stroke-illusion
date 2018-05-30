import processing.serial.*;

class MicroController
{
  String portName;
  Serial mcuPort;

  PApplet parent;

  int minPulseWidth = 0;
  int maxPulseWidth = 1023;

  public MicroController(PApplet parent, String portName)
  {
    this.portName = portName;
    this.parent = parent;
  }

  public void attach()
  {
    mcuPort = new Serial(parent, portName, 115200);
  }

  public void detach()
  {
    mcuPort.stop();
    mcuPort = null;
  }

  public void writeStrength(int port, float strength)
  {
    writePulse(port, round(map(strength, 0, 1, minPulseWidth, maxPulseWidth)));
  }

  public void writePulse(int port, int pulseWidth)
  {
    write("p:" + nf(port, 2) + ":" + nf(pulseWidth, 4));
  }

  public void write(String command)
  {
    if (isAttached())
      mcuPort.write(command);
  }

  public boolean isAttached()
  {
    return mcuPort.active();
  }
}
