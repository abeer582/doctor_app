import 'package:doctors_app/apps/core/utils/responsive.dart';
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
  late final List<DateTime> _days =
  List.generate(7, (i) => DateTime.now().add(Duration(days: i)));

  int _selectedDayIndex = 0;
  DateTime? _selectedSlot;

  List<DateTime> _generateSlots(int startHour, int count) {
    return List.generate(
      count,
          (i) => DateTime(2024, 1, 1, startHour).add(Duration(minutes: 30 * i)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final afternoonSlots = _generateSlots(13, 7);
    final eveningSlots = _generateSlots(17, 5);

    final bool hasSlots = _selectedDayIndex >= 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: Text('Select Time',
            style: AppTextStyles.title.copyWith(fontSize: 20)),
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
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.fieldFill,
                      child: Icon(Icons.person,
                          color: AppColors.grey, size: 32),
                    ),
                    SizedBox(width: context.width(0.03)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.doctor.name,
                              style: AppTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w700)),
                          Text(widget.doctor.clinic,
                              style: AppTextStyles.hint.copyWith(fontSize: 12)),
                          Row(
                            children: List.generate(
                              5,
                                  (i) => Icon(
                                i < widget.doctor.rating.round()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
              SizedBox(height: context.height(0.03)),

              SizedBox(
                height: context.height(0.09),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _days.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final day = _days[index];
                    final isSelected = index == _selectedDayIndex;
                    final label = index == 0
                        ? 'Today, ${DateFormat('d MMM').format(day)}'
                        : index == 1
                        ? 'Tomorrow, ${DateFormat('d MMM').format(day)}'
                        : DateFormat('EEE, d MMM').format(day);
                    return GestureDetector(
                      onTap: () => setState(() {
                        _selectedDayIndex = index;
                        _selectedSlot = null;
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.fieldFill,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(label,
                                style: AppTextStyles.body.copyWith(
                                    color: isSelected
                                        ? AppColors.background
                                        : AppColors.textPrimary,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              index == 0 ? 'No slots available' : '9 slots',
                              style: AppTextStyles.hint.copyWith(
                                  fontSize: 11,
                                  color: isSelected
                                      ? AppColors.background
                                      : AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: context.height(0.03)),

              Center(
                child: Text(
                  DateFormat('EEEE, d MMM')
                      .format(_days[_selectedDayIndex]),
                  style: AppTextStyles.title.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(height: context.height(0.02)),

              if (!hasSlots) ...[
                Center(
                    child: Text('No slots available',
                        style: AppTextStyles.subtitle)),
                SizedBox(height: context.height(0.02)),
                ElevatedButton(
                  onPressed: () => setState(() => _selectedDayIndex = 1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                      'Next availability on ${DateFormat('EEE, d MMM').format(_days[1])}',
                      style: AppTextStyles.button),
                ),
                SizedBox(height: context.height(0.02)),
                Center(child: Text('OR', style: AppTextStyles.hint)),
                SizedBox(height: context.height(0.02)),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Contact Clinic',
                      style: AppTextStyles.button
                          .copyWith(color: AppColors.primary)),
                ),
              ]

              else ...[
                _SlotSection(
                  title: 'Afternoon ${afternoonSlots.length} slots',
                  slots: afternoonSlots,
                  selectedSlot: _selectedSlot,
                  onSelect: (s) => setState(() => _selectedSlot = s),
                ),
                SizedBox(height: context.height(0.02)),
                _SlotSection(
                  title: 'Evening ${eveningSlots.length} slots',
                  slots: eveningSlots,
                  selectedSlot: _selectedSlot,
                  onSelect: (s) => setState(() => _selectedSlot = s),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SlotSection extends StatelessWidget {
  final String title;
  final List<DateTime> slots;
  final DateTime? selectedSlot;
  final ValueChanged<DateTime> onSelect;

  const _SlotSection({
    required this.title,
    required this.slots,
    required this.selectedSlot,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: slots.map((slot) {
            final isSelected = slot == selectedSlot;
            return GestureDetector(
              onTap: () => onSelect(slot),
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.fieldFill,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  DateFormat('h:mm a').format(slot),
                  style: AppTextStyles.body.copyWith(
                    color: isSelected
                        ? AppColors.background
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}