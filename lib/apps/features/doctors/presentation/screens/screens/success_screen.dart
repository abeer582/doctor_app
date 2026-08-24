import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../generated/app_colors.dart';
import '../../../../../../generated/style.dart';

class SuccessScreen extends StatelessWidget {
  final Map<String, dynamic> appointment;
  const SuccessScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final doctorName = appointment['doctorName'] ?? 'the doctor';
    final date = appointment['date'] ?? '';
    final time = appointment['time'] ?? '';

    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(0.15),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.15),
                  ),
                  child: Icon(Icons.thumb_up,
                      size: 50, color: AppColors.primary),
                ),
                const SizedBox(height: 24),

                Text('Thank You !',
                    style: AppTextStyles.title.copyWith(fontSize: 26)),
                const SizedBox(height: 8),

                Text('Your Appointment Successful',
                    style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),

                Text(
                  'You booked an appointment with $doctorName '
                      'on $date at $time',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.hint,
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text('Done',
                        style: AppTextStyles.button.copyWith(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 12),

                TextButton(
                  onPressed: () => context.pop(),
                  child: Text('Edit your appointment',
                      style: AppTextStyles.subtitle
                          .copyWith(color: AppColors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}