import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:bookie_app/core/widgets/app_botton.dart';
import 'package:bookie_app/core/widgets/custom_text_form_feild.dart';
import 'package:bookie_app/core/widgets/icon_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatNewPasswordScreen extends StatelessWidget {
  const CreatNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBack(),
              29.verticalSpace,
              Text('Create New Password', style: AppTextStyle.mainText),
              10.verticalSpace,
              Text(
                'Please enter a new password for your account. You can change it later.',
                style: AppTextStyle.hintText,
              ),
              30.verticalSpace,
              CustomTextFormField(hintText: "Enter Your Password"),
              22.verticalSpace,
              CustomTextFormField(hintText: "Confirm Your Password"),
              28.verticalSpace,
              AppBotton(title: 'Send Password'),
            ],
          ),
        ),
      ),
    );
  }
}
