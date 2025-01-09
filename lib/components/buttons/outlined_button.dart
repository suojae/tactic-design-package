import 'package:flutter/material.dart';
import 'button_size.dart';
import 'button_type.dart';

final class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final bool isLoading;
  final bool isDisabled;

  const OutlinedButtonWidget({
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const buttonType = ButtonType.outlined;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonType.backgroundColor(isDisabled),
        foregroundColor: buttonType.textColor(isDisabled),
        side: BorderSide(color: buttonType.borderColor(isDisabled)),
        minimumSize: Size(double.infinity, size.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(text, style: TextStyle(fontSize: size.fontSize)),
    );
  }
}
