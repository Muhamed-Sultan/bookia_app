import 'package:bookia_app/bookia_app.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bookia_app/core/services/locale/shared_local.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioFactory.init();
  await SharedLocal.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const BookiaApp(),
    ),
  );
}
