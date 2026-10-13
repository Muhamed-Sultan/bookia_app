import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBotton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final Function()? onTap;
  const AppBotton({
    super.key,
    required this.title,
    this.bgColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.mainColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          title,
          style: AppTextStyle.hintText.copyWith(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
