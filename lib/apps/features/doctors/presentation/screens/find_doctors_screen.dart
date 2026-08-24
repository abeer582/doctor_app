import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/style.dart';
import '../../../../../generated/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/doctor_model.dart';

class FindDoctorsScreen extends StatefulWidget {
  const FindDoctorsScreen({super.key});

  @override
  State<FindDoctorsScreen> createState() => _FindDoctorsScreenState();
}

class _FindDoctorsScreenState extends State<FindDoctorsScreen> {
  final TextEditingController _searchController =
  TextEditingController(text: 'Dentist');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
        title: Text('Find Doctors',
            style: AppTextStyles.title.copyWith(fontSize: 20)),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width(0.06)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.fieldFill,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: AppTextStyles.body,
                        decoration: InputDecoration(
                          hintText: 'Search doctor...',
                          hintStyle: AppTextStyles.hint,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: AppColors.grey),
                      onPressed: () => _searchController.clear(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.height(0.02)),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width(0.06),
                  vertical: context.height(0.01),
                ),
                itemCount: dummyDoctors.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: context.height(0.02)),
                itemBuilder: (context, index) {
                  final doctor = dummyDoctors[index];
                  return _DoctorListCard(doctor: doctor);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorListCard extends StatefulWidget {
  final Doctor doctor;
  const _DoctorListCard({required this.doctor});

  @override
  State<_DoctorListCard> createState() => _DoctorListCardState();
}

class _DoctorListCardState extends State<_DoctorListCard> {
  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;
    return GestureDetector(
      onTap: () => context.push('/doctor-details', extra: doctor),
      child: Container(
        padding: EdgeInsets.all(context.width(0.03)),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.fieldFill,
                  child: Icon(Icons.person, color: AppColors.grey, size: 32),
                ),
                SizedBox(width: context.width(0.03)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor.name,
                          style: AppTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600)),
                      Text(doctor.speciality, style: AppTextStyles.hint),
                      const SizedBox(height: 2),
                      Text('${doctor.experienceYears} Years experience',
                          style: AppTextStyles.hint.copyWith(fontSize: 12)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.thumb_up,
                              color: AppColors.primary, size: 14),
                          const SizedBox(width: 4),
                          Text('${doctor.satisfaction}%',
                              style: AppTextStyles.hint.copyWith(fontSize: 12)),
                          const SizedBox(width: 12),
                          const Icon(Icons.chat_bubble_outline,
                              color: AppColors.grey, size: 14),
                          const SizedBox(width: 4),
                          Text('${doctor.patientStories} Patient Stories',
                              style: AppTextStyles.hint.copyWith(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    doctor.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: doctor.isFavorite ? Colors.red : AppColors.grey,
                  ),
                  onPressed: () =>
                      setState(() => doctor.isFavorite = !doctor.isFavorite),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next Available',
                        style: AppTextStyles.hint.copyWith(fontSize: 12)),
                    Text(doctor.nextAvailable,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () =>
                      context.push('/select-time', extra: doctor),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Book Now', style: AppTextStyles.button),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}