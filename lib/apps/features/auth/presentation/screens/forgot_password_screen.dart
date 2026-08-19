import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/bottom_sheet_card.dart';
import '../../../../core/utils/responsive.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('Forgot password', style: AppTextStyles.title),
                  SizedBox(height: context.height(0.01)),
                  Text(
                    'Enter your email for the verification process, '
                        'we will send 4 digits code to your email.',
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(height: context.height(0.04)),
                  const CustomTextField(hint: 'Email'),
                  SizedBox(height: context.height(0.04)),
                  CustomButton(text: 'Continue', onPressed: () => context.go('/otp')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}