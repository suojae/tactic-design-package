import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tactic_design_system_package/components/text_fields/text_field_size.dart';
import 'package:tactic_design_system_package/components/text_fields/text_field_type.dart';
import 'package:tactic_design_system_package/components/text_fields/tactic_text_field_theme.dart';

final class TacticTextField extends StatefulWidget {
  final TacticTextFieldSize size;
  final TacticTextFieldType type;
  final TacticTextFieldTheme theme;
  final String label;
  final String? hint;
  final bool enabled;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? errorText;

  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final Widget? prefixIcon;

  final bool showTimer;
  final Duration timerDuration;
  final VoidCallback? onTimerTap;

  const TacticTextField({
    super.key,
    required this.size,
    required this.type,
    required this.theme,
    required this.label,
    this.hint,
    this.enabled = true,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.prefixIcon,
    this.showTimer = false,
    this.timerDuration = const Duration(minutes: 3),
    this.onTimerTap,
  });

  @override
  State<TacticTextField> createState() => _TacticTextFieldState();
}

class _TacticTextFieldState extends State<TacticTextField> {
  late final TextEditingController _controller;
  bool _obscureText = false;
  late Duration _remainingTime;
  bool _isTicking = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _obscureText = widget.type == TacticTextFieldType.password;
    _remainingTime = widget.timerDuration;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (!mounted || _isTicking) return;

    setState(() {
      _remainingTime = widget.timerDuration;
      _isTicking = true;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_remainingTime.inSeconds == 0) {
        setState(() {
          _isTicking = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      }
    });
  }

  String get _timerText {
    final minutes = _remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: widget.errorText != null
            ? widget.theme.errorBorderColor
            : widget.theme.focusedBorderColor.withValues(alpha: 0.4),
        width: 1,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: widget.errorText != null ? widget.theme.errorBorderColor : widget.theme.focusedBorderColor,
        width: 1.6,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            style: TextStyle(color: widget.theme.labelColor, fontSize: widget.size.fontSize),
          ),
          const SizedBox(height: 4),
        ],
        SizedBox(
          height: widget.size.height,
          child: TextField(
            controller: _controller,
            obscureText: _obscureText,
            enabled: widget.enabled,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            cursorColor: widget.theme.cursorColor,
            style: TextStyle(color: widget.theme.textColor, fontSize: widget.size.fontSize),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.enabled ? widget.theme.backgroundColor : widget.theme.disabledBackgroundColor,
              hintText: widget.hint,
              hintStyle: TextStyle(color: widget.theme.hintColor),
              contentPadding: widget.size.contentPadding,
              border: border,
              focusedBorder: focusedBorder,
              enabledBorder: border,
              errorText: widget.errorText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: _buildSuffix(),
            ),
            keyboardType: _keyboardTypeByType(widget.type),
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(widget.errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  Widget? _buildSuffix() {
    Widget? buildDefaultIconButton() {
      if (widget.suffixIcon == null) return null;
      return IconButton(
        icon: widget.suffixIcon!,
        color: widget.theme.iconColor,
        onPressed: widget.onSuffixIconTap,
      );
    }

    switch (widget.type) {
      case TacticTextFieldType.password:
        return IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          color: widget.theme.iconColor,
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        );

      case TacticTextFieldType.withTimer:
        if (widget.showTimer) {
          return GestureDetector(
            onTap: () {
              if (!_isTicking) _startTimer();
              widget.onTimerTap?.call();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(_timerText, style: TextStyle(color: widget.theme.labelColor)),
            ),
          );
        }
        return null;

      case TacticTextFieldType.withIconBtn:
      case TacticTextFieldType.phoneNumber:
      case TacticTextFieldType.normal:
        return buildDefaultIconButton();
    }
  }

  TextInputType _keyboardTypeByType(TacticTextFieldType type) {
    switch (type) {
      case TacticTextFieldType.password:
        return TextInputType.text;
      case TacticTextFieldType.phoneNumber:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }
}
