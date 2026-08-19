import 'package:flutter/material.dart';
import '../../../generated/app_colors.dart';
import '../utils/responsive.dart';

class BottomSheetCard extends StatelessWidget {
  final Widget child;
  const BottomSheetCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        context.width(0.06),
        context.height(0.02),
        context.width(0.06),
        context.height(0.04),
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: EdgeInsets.only(bottom: context.height(0.03)),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}