import 'package:flutter/material.dart';
import '../../theme/colors.dart';

enum CalloutType { basic, basicWithTitle, info, warning, toastBasic, toastError }

extension CalloutTypeExtension on CalloutType {
  Color get backgroundColor {
    switch (this) {
      case CalloutType.basic:
      case CalloutType.basicWithTitle:
        return AppColors.base.deep;
      case CalloutType.info:
        return AppColors.primary.blue;
      case CalloutType.warning:
        return AppColors.semantic.red;
      case CalloutType.toastBasic:
        return AppColors.base.deep;
      case CalloutType.toastError:
        return AppColors.semantic.darkRed;
    }
  }

  String? get actionText {
    switch (this) {
      case CalloutType.info:
        return "구독하기";
      case CalloutType.warning:
        return "결제하기";
      default:
        return null;
    }
  }

  bool get hasCloseButton => this == CalloutType.basic || this == CalloutType.basicWithTitle;
  bool get hasIcon => this == CalloutType.toastError;
  bool get hasTitle => this == CalloutType.basicWithTitle || this == CalloutType.info || this == CalloutType.warning;
}
