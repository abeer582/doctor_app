import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../../generated/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.width(0.06)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.height(0.025)),
                  Center(child: Text('Join us to start searching', style: AppTextStyles.heading)),
                  SizedBox(height: context.height(0.01)),
                  Center(
                    child: Text(
                      'You can search course, apply course and find scholarship for abroad studies',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: context.height(0.04)),

                  Row(
                    children: [
                      const Expanded(child: SocialButton(text: 'Google', icon: Icons.g_mobiledata, iconColor: Colors.red)),
                      SizedBox(width: context.width(0.04)),
                      const Expanded(child: SocialButton(text: 'Facebook', icon: Icons.facebook, iconColor: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: context.height(0.03)),

                  const CustomTextField(hint: 'Name'),
                  SizedBox(height: context.height(0.02)),
                  const CustomTextField(hint: 'Email'),
                  SizedBox(height: context.height(0.02)),
                  const CustomTextField(hint: 'Password', isPassword: true, suffixIcon: Icons.visibility_off),
                  SizedBox(height: context.height(0.02)),

                  Row(
                    children: [
                      const Icon(Icons.check_box, color: AppColors.primary, size: 20),
                      SizedBox(width: context.width(0.02)),
                      Expanded(
                        child: Text('I agree with the Terms of Service & Privacy Policy',
                            style: AppTextStyles.hint),
                      ),
                    ],
                  ),
                  SizedBox(height: context.height(0.03)),

                  CustomButton(text: 'Sign up', onPressed: () => context.go('/home')),
                  SizedBox(height: context.height(0.02)),

                  Center(
                    child: TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text('Have an account? Log in', style: AppTextStyles.subtitle),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}