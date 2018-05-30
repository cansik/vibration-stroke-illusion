abstract class VibrationPattern
{
  VibrationDevice[] devices;
  String name;

  public VibrationPattern(String name, VibrationDevice[] devices)
  {
    this.name = name;
    this.devices = devices;
  }

  abstract void update();
}
