import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../generated/style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/bottom_sheet_card.dart';
import '../../../../../generated/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double fieldSize = context.width(0.15);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFFE6F9EF)],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomSheetCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter 4 Digits Code', style: AppTextStyles.title),
                  SizedBox(height: context.height(0.01)),
                  Text(
                    'Enter the 4 digits code that you received on your email.',
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(height: context.height(0.04)),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (_) {},
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: fieldSize,
                      fieldWidth: fieldSize,
                      activeColor: AppColors.primary,
                      selectedColor: AppColors.primary,
                      inactiveColor: AppColors.border,
                    ),
                  ),
                  SizedBox(height: context.height(0.04)),
                  CustomButton(text: 'Continue', onPressed: () => context.go('/reset')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}