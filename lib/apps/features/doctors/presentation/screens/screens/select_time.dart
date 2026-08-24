import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../../generated/app_colors.dart';
import '../../../../../../generated/style.dart';

import '../../../data/models/doctor_model.dart';

class SelectTimeScreen extends StatefulWidget {
  final Doctor doctor;
  const SelectTimeScreen({super.key, required this.doctor});

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  int _selectedDay = 0;
  String? _selectedSlot;

  final List<DateTime> _days =
  List.generate(7, (i) => DateTime.now().add(Duration(days: i)));

  final List<String> afternoonSlots = [
    '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM',
    '3:00 PM', '3:30 PM', '4:00 PM'
  ];
  final List<String> eveningSlots = [
    '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM'
  ];

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Select Time', style: AppTextStyles.title.copyWith(fontSize: 20)),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.fieldFill,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.person, color: AppColors.grey),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doctor.name, style: AppTextStyles.body),
                          Text(doctor.clinic, style: AppTextStyles.hint),
                        ],
                      ),
                    ),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                height: 70,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _days.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final day = _days[index];
                    final isSelected = _selectedDay == index;
                    final label =
                    index == 0 ? 'Today' : DateFormat('EEE').format(day);
                    final date = DateFormat('d MMM').format(day);

                    return GestureDetector(
                      onTap: () => setState(() => _selectedDay = index),
                      child: Container(
                        width: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : AppColors.fieldFill,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$label, $date',
                                style: AppTextStyles.body.copyWith(
                                  color: isSelected ? Colors.white : null,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text('9 slots available',
                                style: AppTextStyles.hint.copyWith(
                                  fontSize: 11,
                                  color: isSelected ? Colors.white70 : AppColors.grey,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),


              Text('Afternoon', style: AppTextStyles.title.copyWith(fontSize: 16)),
              const SizedBox(height: 12),
              _buildSlots(afternoonSlots),
              const SizedBox(height: 20),

              Text('Evening', style: AppTextStyles.title.copyWith(fontSize: 16)),
              const SizedBox(height: 12),
              _buildSlots(eveningSlots),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: _selectedSlot == null
                ? null
                : () {
              final day = _days[_selectedDay];
              final formattedDate = DateFormat('MMMM d').format(day);

              context.push(
                '/Success',
                extra: {
                  'doctorName': doctor.name,
                  'specialty': doctor.speciality,
                  'date': formattedDate,
                  'time': _selectedSlot,
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.grey.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text('Confirm',
                style: AppTextStyles.button.copyWith(fontSize: 16)),
          ),
        ),
      ),
    );
  }

  Widget _buildSlots(List<String> slots) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: slots.map((slot) {
        final isSelected = _selectedSlot == slot;
        return GestureDetector(
          onTap: () => setState(() => _selectedSlot = slot),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.fieldFill,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Text(slot,
                style: AppTextStyles.body.copyWith(
                  color: isSelected ? Colors.white : null,
                )),
          ),
        );
      }).toList(),
    );
  }
}