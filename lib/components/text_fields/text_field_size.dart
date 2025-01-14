
import 'package:flutter/cupertino.dart';

enum TacticTextFieldSize {
  large,
  medium,
  small,
}

extension TacticTextFieldSizeExtension on TacticTextFieldSize {
  double get height {
    switch (this) {
      case TacticTextFieldSize.large:
        return 56.0;
      case TacticTextFieldSize.medium:
        return 48.0;
      case TacticTextFieldSize.small:
        return 40.0;
    }
  }

  double get fontSize {
    switch (this) {
      case TacticTextFieldSize.large:
        return 16.0;
      case TacticTextFieldSize.medium:
        return 14.0;
      case TacticTextFieldSize.small:
        return 12.0;
    }
  }

  EdgeInsets get contentPadding {
    switch (this) {
      case TacticTextFieldSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0);
      case TacticTextFieldSize.medium:
        return const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0);
      case TacticTextFieldSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0);
    }
  }
}