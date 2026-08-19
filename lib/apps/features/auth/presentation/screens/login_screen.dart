import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../core/utils/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                children: [
                  SizedBox(height: context.height(0.025)),
                  Text('Welcome back', style: AppTextStyles.title),
                  SizedBox(height: context.height(0.01)),
                  Text(
                    'You can search course, apply course and find scholarship for abroad studies',
                    style: AppTextStyles.subtitle,
                    textAlign: TextAlign.center,
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

                  const CustomTextField(hint: 'itsmemamun1@gmail.com', suffixIcon: Icons.check),
                  SizedBox(height: context.height(0.02)),
                  const CustomTextField(hint: '••••••••', isPassword: true, suffixIcon: Icons.visibility_off),
                  SizedBox(height: context.height(0.03)),

                  CustomButton(text: 'Login', onPressed: () => context.go('/home')),
                  SizedBox(height: context.height(0.02)),

                  TextButton(
                    onPressed: () => context.go('/forgot'),
                    child: Text('Forgot password', style: AppTextStyles.subtitle),
                  ),

                  SizedBox(height: context.height(0.05)),
                  TextButton(
                    onPressed: () => context.go('/signup'),
                    child: Text("Don't have an account? Join us", style: AppTextStyles.subtitle),
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