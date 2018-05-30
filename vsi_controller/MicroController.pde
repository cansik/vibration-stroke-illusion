import processing.serial.*;

class MicroController
{
  String portName;
  Serial mcuPort;

  PApplet parent;

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

  public void writePulse(int port, int pulseWidth)
  {
    write("p:" + nf(port, 2) + ":" + nf(pulseWidth, 3));
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
