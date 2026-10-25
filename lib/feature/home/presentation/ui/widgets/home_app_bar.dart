import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.images.splash.image(width: 100.w),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.SearchScreen);
          },
          child: SvgPicture.asset(Assets.icons.searchIcon),
        ),
      ],
    );
  }
}
