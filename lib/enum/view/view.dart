enum ViewEnum {
  /// Size: 8
  octa(8),

  /// Size: 16
  hexa(16),

  /// Size: 24
  ennea(24),

  /// Size: 32
  tetra(32),

  /// Size: 48
  penta(48),

  /// Size: 64
  mega(64),

  /// Size: 128
  hepta(128),

  /// Size: 256
  teta(256),

  /// Size: 512
  zeta(512),

  /// Size: 1024
  deca(1024),
  ;

  final double size;
  const ViewEnum(this.size);
}
