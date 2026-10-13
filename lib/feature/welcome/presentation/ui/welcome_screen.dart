import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:bookie_app/core/widgets/app_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset("assets/images/bg.png").image,
          ),
        ),
        child: Column(
          children: [
            135.verticalSpace,
            Image.asset("assets/images/splash.png"),
            15.verticalSpace,
            Text('Order Your Book Now!', style: AppTextStyle.hintText),
            Spacer(),
            AppBotton(title: 'Login',onTap: () {
              Navigator.pushNamed(context, AppRoutes.loginscreen)
            },),
            20.verticalSpace,
            AppBotton(
              title: 'Register',
              bgColor: Colors.white,
              textColor: Colors.black,
            ),
            92.verticalSpace,
          ],
        ),
      ),
    );
  }
}
