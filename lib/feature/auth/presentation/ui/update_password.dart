import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/widgets/icon_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconBack(),
            45.verticalSpace,
            Text('New Password', style: AppTextStyle.mainText),
          ],
        ),
      ),
    );
  }
}
