import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../../../../../generated/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.width(0.06)),
          child: Column(
            children: [
              SizedBox(height: context.height(0.025)),
              const LogoWidget(),
              SizedBox(height: context.height(0.05)),
              Text('Choose your role', style: AppTextStyles.title),
              SizedBox(height: context.height(0.01)),
              Text(
                'The selected role determines the experience and available features.',
                style: AppTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height(0.04)),

              _RoleCard(
                icon: Icons.person_outline,
                title: 'Patient',
                desc: 'Find doctors, book appointments, and manage your medical records.',
                isSelected: _selectedIndex == 0,
                onTap: () => setState(() => _selectedIndex = 0),
              ),
              SizedBox(height: context.height(0.02)),

              _RoleCard(
                icon: Icons.admin_panel_settings_outlined,
                title: 'Admin',
                desc: 'Manage doctors, appointments, users, and the platform.',
                isSelected: _selectedIndex == 1,
                onTap: () => setState(() => _selectedIndex = 1),
              ),

              const Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () => context.go('/signup'),
              ),
              SizedBox(height: context.height(0.02)),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.width(0.04)),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.05) : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(icon, color: AppColors.primary),
            ),
            SizedBox(width: context.width(0.03)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.body),
                  SizedBox(height: context.height(0.005)),
                  Text(desc, style: AppTextStyles.hint),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}