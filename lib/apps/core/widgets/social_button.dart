import 'package:flutter/material.dart';
import '../../../generated/app_colors.dart';
import '../../../generated/style.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.body),
        ],
      ),
    );
  }
}