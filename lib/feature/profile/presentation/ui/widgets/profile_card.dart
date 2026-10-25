import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final String text;
  const ProfileCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(22.r),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: AppTextStyle.hintText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, size: 20.r),
          ],
        ),
      ),
    );
  }
}
