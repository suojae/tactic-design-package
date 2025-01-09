enum ButtonSize { xl, lg, md, sm }

extension ButtonSizeExtension on ButtonSize {
  static const Map<ButtonSize, double> _heights = {
    ButtonSize.xl: 56,
    ButtonSize.lg: 48,
    ButtonSize.md: 40,
    ButtonSize.sm: 32,
  };

  static const Map<ButtonSize, double> _fontSizes = {
    ButtonSize.xl: 18,
    ButtonSize.lg: 16,
    ButtonSize.md: 14,
    ButtonSize.sm: 12,
  };

  double get height => _heights[this]!;

  double get fontSize => _fontSizes[this]!;
}
