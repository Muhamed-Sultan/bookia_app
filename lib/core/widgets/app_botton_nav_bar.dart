import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/feature/profile/presentation/ui/profile_screen.dart';
import 'package:bookia_app/feature/wish_list/presentation/ui/wish_list_screen.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()..getBestSellerBooks(),
      child: const HomeScreen(),
    ),
    const WishListScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  final List<String> icons = [
    Assets.icons.home,
    Assets.icons.bookmark,
    Assets.icons.category,
    Assets.icons.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: icons.length,
        tabBuilder: (index, isActive) {
          return Center(
            child: SvgPicture.asset(
              icons[index],
              width: 27.r,
              height: 27.r,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.amber : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          );
        },
        activeIndex: currentIndex,
        gapLocation: GapLocation.none,
        backgroundColor: AppColors.backgroundColor,
        leftCornerRadius: 15.r,
        rightCornerRadius: 15.r,
        height: 56.h,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
