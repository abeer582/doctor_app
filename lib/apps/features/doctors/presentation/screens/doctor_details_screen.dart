import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../../generated/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/doctor_model.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: Text('Doctor Details',
            style: AppTextStyles.title.copyWith(fontSize: 20)),
        actions: const [
          Icon(Icons.search, color: AppColors.textPrimary),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.width(0.06)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(context.width(0.04)),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: AppColors.fieldFill,
                          child: Icon(Icons.person,
                              color: AppColors.grey, size: 40),
                        ),
                        SizedBox(width: context.width(0.04)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(doctor.name,
                                  style: AppTextStyles.body.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                              Text(doctor.speciality,
                                  style: AppTextStyles.hint),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  ...List.generate(
                                    5,
                                        (i) => Icon(
                                      i < doctor.rating.round()
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text('\$${doctor.pricePerHour}/hr',
                                      style: AppTextStyles.body.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.favorite,
                            color: doctor.isFavorite
                                ? Colors.red
                                : AppColors.grey),
                      ],
                    ),
                    SizedBox(height: context.height(0.02)),
                    CustomButton(
                      text: 'Book Now',
                      onPressed: () =>
                          context.push('/select-time', extra: doctor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.height(0.03)),

              Row(
                children: const [
                  Expanded(child: _StatBox(number: '100', label: 'Running')),
                  SizedBox(width: 12),
                  Expanded(child: _StatBox(number: '500', label: 'Ongoing')),
                  SizedBox(width: 12),
                  Expanded(child: _StatBox(number: '700', label: 'Patient')),
                ],
              ),
              SizedBox(height: context.height(0.03)),

              Text('Services',
                  style: AppTextStyles.title.copyWith(fontSize: 18)),
              SizedBox(height: context.height(0.015)),
              const _ServiceItem(
                  number: '1',
                  text: 'Patient care should be the number one priority.'),
              const _ServiceItem(
                  number: '2',
                  text:
                  'If you run your practice you know how frustrating.'),
              const _ServiceItem(
                  number: '3',
                  text:
                  "That's why some of appointment reminder system."),
              SizedBox(height: context.height(0.02)),

              Container(
                height: context.height(0.2),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.fieldFill,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.map,
                    size: 60, color: AppColors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String number;
  final String label;
  const _StatBox({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(number,
              style: AppTextStyles.title.copyWith(fontSize: 20)),
          Text(label, style: AppTextStyles.hint),
        ],
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final String number;
  final String text;
  const _ServiceItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$number.',
                  style: AppTextStyles.body
                      .copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
              const SizedBox(width: 8),
              Expanded(child: Text(text, style: AppTextStyles.subtitle)),
            ],
          ),
          const Divider(height: 20),
        ],
      ),
    );
  }
}