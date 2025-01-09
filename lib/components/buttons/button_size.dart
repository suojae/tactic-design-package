enum ButtonSize { xl, lg, md, sm }

extension ButtonSizeExtension on ButtonSize {
  double get height {
    switch (this) {
      case ButtonSize.xl:
        return 56;
      case ButtonSize.lg:
        return 48;
      case ButtonSize.md:
        return 40;
      case ButtonSize.sm:
        return 32;
    }
  }

  double get fontSize {
    switch (this) {
      case ButtonSize.xl:
        return 18;
      case ButtonSize.lg:
        return 16;
      case ButtonSize.md:
        return 14;
      case ButtonSize.sm:
        return 12;
    }
  }
}
