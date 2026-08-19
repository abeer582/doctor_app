import 'package:flutter/material.dart';
import '../apps/core/router/app_router.dart';
import 'app_colors.dart';

void main() {
  runApp(const DoctorHuntApp());
}

class DoctorHuntApp extends StatelessWidget {
  const DoctorHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Doctor Hunt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,

    );
  }
}