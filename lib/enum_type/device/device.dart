enum DeviceSize {
  mobile(0, 600),
  tablet(601, 1200),
  desktop(1201, 2560),
  quadraVista(2560, double.infinity),
  ;

  final double min;
  final double max;
  const DeviceSize(this.min, this.max);
}
