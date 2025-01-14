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
  late TextEditingController _controller;
  bool _obscureText = false;
  late Duration _remainingTime;
  late bool _isTicking;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _obscureText = (widget.type == TacticTextFieldType.password);
    _remainingTime = widget.timerDuration;
    _isTicking = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _remainingTime = widget.timerDuration;
      _isTicking = true;
    });

    // 1초 간격으로 타이머 카운트 다운
    Future.doWhile(() async {
      if (_remainingTime.inSeconds <= 0) {
        setState(() {
          _isTicking = false;
        });
        return false;
      }
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() {
        _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
      });
      return _isTicking;
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
        // 라벨
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            style: TextStyle(
              color: widget.theme.labelColor,
              fontSize: widget.size.fontSize,
            ),
          ),
          const SizedBox(height: 4),
        ],

        // 실제 텍스트필드
        SizedBox(
          height: widget.size.height,
          child: TextField(
            controller: _controller,
            obscureText: _obscureText,
            enabled: widget.enabled,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            cursorColor: widget.theme.cursorColor,
            style: TextStyle(
              color: widget.theme.textColor,
              fontSize: widget.size.fontSize,
            ),
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

        // 에러 텍스트
        if (widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }

  Widget? _buildSuffix() {
    switch (widget.type) {
      // 비밀번호 토글 아이콘
      case TacticTextFieldType.password:
        return IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: widget.theme.iconColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        );

      // 타이머 표시
      case TacticTextFieldType.withTimer:
        if (widget.showTimer) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  if (!_isTicking) {
                    _startTimer();
                  }
                  widget.onTimerTap?.call();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    _timerText,
                    style: TextStyle(color: widget.theme.labelColor),
                  ),
                ),
              ),
            ],
          );
        }
        return null;

      // 아이콘 버튼
      case TacticTextFieldType.withIconBtn:
        if (widget.suffixIcon != null) {
          return IconButton(
            icon: widget.suffixIcon!,
            color: widget.theme.iconColor,
            onPressed: widget.onSuffixIconTap,
          );
        }
        return null;

      // 전화번호
      case TacticTextFieldType.phoneNumber:
        if (widget.suffixIcon != null) {
          return IconButton(
            icon: widget.suffixIcon!,
            color: widget.theme.iconColor,
            onPressed: widget.onSuffixIconTap,
          );
        }
        return null;

      // 기본(normal)
      default:
        // suffixIcon 직접 주어진 경우
        if (widget.suffixIcon != null) {
          return IconButton(
            icon: widget.suffixIcon!,
            color: widget.theme.iconColor,
            onPressed: widget.onSuffixIconTap,
          );
        }
        return null;
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
