import 'package:flutter/material.dart';
import 'button_size.dart';
import 'button_type.dart';

final class FilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonSize size;
  final bool isLoading;
  final bool isDisabled;

  const FilledButton({
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const buttonType = ButtonType.filled;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType.backgroundColor(isDisabled),
        foregroundColor: buttonType.textColor(isDisabled),
        minimumSize: Size(double.infinity, size.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(text, style: TextStyle(fontSize: size.fontSize)),
    );
  }
}
