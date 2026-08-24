import 'package:doctors_app/apps/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../generated/app_colors.dart';
import '../../../../../../generated/style.dart';
import '../../../data/models/doctor_model.dart';

class FavouriteDoctorsScreen extends StatelessWidget {
  const FavouriteDoctorsScreen({super.key});

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
        title: Text('Favourite Doctors',
            style: AppTextStyles.title.copyWith(fontSize: 20)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.width(0.06)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                        decoration: InputDecoration(
                          hintText: 'Dentist',
                          hintStyle: AppTextStyles.hint,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.close, color: AppColors.grey),
                  ],
                ),
              ),
              SizedBox(height: context.height(0.025)),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyDoctors.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final doctor = dummyDoctors[index];
                  return _FavouriteCard(doctor: doctor);
                },
              ),
              SizedBox(height: context.height(0.03)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Feature Doctor',
                      style: AppTextStyles.title.copyWith(fontSize: 18)),
                  Text('See all',
                      style: AppTextStyles.subtitle
                          .copyWith(color: AppColors.primary)),
                ],
              ),
              SizedBox(height: context.height(0.015)),

              SizedBox(
                height: context.height(0.2),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyDoctors.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final doctor = dummyDoctors[index];
                    return _FeatureCard(doctor: doctor);
                  },
                ),
              ),
              SizedBox(height: context.height(0.02)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        onTap: (index) {
          if (index == 0) context.go('/home');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        ],
      ),
    );
  }
}

class _FavouriteCard extends StatefulWidget {
  final Doctor doctor;
  const _FavouriteCard({required this.doctor});

  @override
  State<_FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<_FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;
    return GestureDetector(
      onTap: () => context.push('/doctor-details', extra: doctor),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () =>
                    setState(() => doctor.isFavorite = !doctor.isFavorite),
                child: Icon(
                  doctor.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: doctor.isFavorite ? Colors.red : AppColors.grey,
                  size: 20,
                ),
              ),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.fieldFill,
              child: Icon(Icons.person, color: AppColors.grey, size: 34),
            ),
            const SizedBox(height: 8),
            Text(doctor.name,
                style: AppTextStyles.body
                    .copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(doctor.speciality,
                style: AppTextStyles.subtitle
                    .copyWith(color: AppColors.primary, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final Doctor doctor;
  const _FeatureCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(0.32),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                doctor.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: doctor.isFavorite ? Colors.red : AppColors.grey,
                size: 16,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  Text('${doctor.rating}',
                      style: AppTextStyles.hint.copyWith(fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Center(
            child: CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.fieldFill,
              child: Icon(Icons.person, color: AppColors.grey, size: 30),
            ),
          ),
          const SizedBox(height: 6),
          Text(doctor.name,
              style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text('\$${doctor.pricePerHour}/ hours',
              style: AppTextStyles.hint.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}