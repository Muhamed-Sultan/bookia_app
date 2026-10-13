import 'package:bookie_app/core/routes/app_router.dart';
import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookieApp extends StatelessWidget {
  const BookieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        theme: ThemeData(
          fontFamily: 'DM',
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        initialRoute: AppRoutes.welcomescreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
