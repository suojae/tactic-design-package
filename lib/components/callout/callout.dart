import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import 'callout_type.dart';
import 'callout_theme.dart';

final class Callout extends StatelessWidget {
  final String? title;
  final String description;
  final CalloutType type;
  final VoidCallback? onClose;
  final VoidCallback? onAction;

  const Callout({
    super.key,
    this.title,
    required this.description,
    required this.type,
    this.onClose,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (type.hasIcon)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.error_outline, color: AppColors.base.white),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null && type.hasTitle)
                  Text(
                    title!,
                    style: CalloutTheme.titleStyle,
                  ),
                Text(
                  description,
                  style: CalloutTheme.descriptionStyle,
                ),
              ],
            ),
          ),
          if (type.actionText != null)
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.base.white.withValues(alpha: 0.8),
              ),
              child: Text(type.actionText!, style: const TextStyle(fontSize: 14)),
            ),
          if (type.hasCloseButton && onClose != null)
            IconButton(
              icon: Icon(Icons.close, color: AppColors.base.white.withValues(alpha: 0.7)),
              onPressed: onClose,
            ),
        ],
      ),
    );
  }
}
