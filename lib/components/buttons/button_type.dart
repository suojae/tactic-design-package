import 'package:flutter/material.dart';
import '../../theme/colors.dart';

enum ButtonType { filled, outlined, text }

extension ButtonTypeExtension on ButtonType {
  Color backgroundColor(bool isDisabled) {
    if (isDisabled) return AppColors.base.deep;
    switch (this) {
      case ButtonType.filled:
        return AppColors.primary.blue;
      case ButtonType.outlined:
        return Colors.transparent;
      case ButtonType.text:
        return Colors.transparent;
    }
  }

  Color borderColor(bool isDisabled) {
    if (isDisabled) return AppColors.base.gray;
    switch (this) {
      case ButtonType.filled:
        return Colors.transparent;
      case ButtonType.outlined:
        return AppColors.primary.blue;
      case ButtonType.text:
        return Colors.transparent;
    }
  }

  Color textColor(bool isDisabled) {
    if (isDisabled) return AppColors.base.input;
    switch (this) {
      case ButtonType.filled:
        return AppColors.base.white;
      case ButtonType.outlined:
        return AppColors.primary.blue;
      case ButtonType.text:
        return AppColors.primary.blue;
    }
  }
}
