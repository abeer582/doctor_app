import 'package:doctors_app/apps/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../../../generated/image_assets.dart';
import '../../../generated/style.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key,this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child:   Image.asset(
          AppImages.logo,
    width: size ?? context.width(0.17),
    fit: BoxFit.contain,
    )
        ),
        const SizedBox(height: 8),
        Text('Doctor Hunt', style: AppTextStyles.title),
      ],
    );
  }
}
