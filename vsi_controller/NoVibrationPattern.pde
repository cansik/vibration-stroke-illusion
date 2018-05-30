class NoVibrationPattern extends VibrationPattern
{
  public NoVibrationPattern(VibrationDevice[] devices)
  {
    super("No Vibration", devices);
  }

  @Override
    public void update()
  {
    for (VibrationDevice d : devices)
    {
      d.write(0);
    }
  }
}
