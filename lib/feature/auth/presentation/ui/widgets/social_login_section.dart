import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginSection extends StatelessWidget {
  final String title;
  final VoidCallback onGoogleTap;

  const SocialLoginSection({
    super.key,
    required this.title,
    required this.onGoogleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.borderColor,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                title,
                style: AppTextStyle.hintText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF6A707C),
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.borderColor,
                thickness: 1,
              ),
            ),
          ],
        ),
        22.verticalSpace,
        InkWell(
          onTap: onGoogleTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            height: 56.h,
            width: 105.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: SvgPicture.asset(
              'assets/icons/google.svg',
              height: 26.h,
              width: 26.w,
            ),
          ),
        ),
      ],
    );
  }
}
