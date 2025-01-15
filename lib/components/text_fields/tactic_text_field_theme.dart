import 'package:flutter/material.dart';
import '../../theme/colors.dart';

final class TacticTextFieldTheme {
  final Color backgroundColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color disabledBackgroundColor;
  final Color textColor;
  final Color labelColor;
  final Color iconColor;
  final Color cursorColor;
  final Color hintColor;

  const TacticTextFieldTheme({
    required this.backgroundColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.disabledBackgroundColor,
    required this.textColor,
    required this.labelColor,
    required this.iconColor,
    required this.cursorColor,
    required this.hintColor,
  });

  factory TacticTextFieldTheme.dark() {
    return TacticTextFieldTheme(
      backgroundColor: AppColors.base.deep,
      focusedBorderColor: AppColors.base.black,
      errorBorderColor: AppColors.semantic.red,
      disabledBackgroundColor: AppColors.base.half,
      textColor: AppColors.base.white,
      labelColor: AppColors.base.gray,
      iconColor: AppColors.base.gray,
      cursorColor: AppColors.base.white,
      hintColor: AppColors.base.gray,
    );
  }

  factory TacticTextFieldTheme.light() {
    return TacticTextFieldTheme(
      backgroundColor: AppColors.base.white,
      focusedBorderColor: AppColors.primary.blue,
      errorBorderColor: AppColors.semantic.red,
      disabledBackgroundColor: AppColors.base.second,
      textColor: AppColors.base.black,
      labelColor: AppColors.base.gray,
      iconColor: AppColors.base.gray,
      cursorColor: AppColors.base.black,
      hintColor: AppColors.base.gray,
    );
  }
}
