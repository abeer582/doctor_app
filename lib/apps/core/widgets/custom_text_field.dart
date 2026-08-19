import 'package:flutter/material.dart';
import '../../../generated/app_colors.dart';
import '../../../generated/style.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData? suffixIcon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.hint,
        filled: true,
        fillColor: AppColors.fieldFill,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: AppColors.grey)
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}