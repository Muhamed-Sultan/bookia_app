import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_app/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/feature/profile/presentation/ui/profile_screen.dart';
import 'package:bookia_app/feature/wish_list/presentation/ui/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final List<IconData> icons = const [
    Icons.home,
    Icons.payment_outlined,
    Icons.shopping_cart,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        iconSize: 27.r,
        icons: icons,
        activeIndex: currentIndex,
        gapLocation: GapLocation.none,
        leftCornerRadius: 15.r,
        rightCornerRadius: 15.r,
        activeColor: Colors.amber,
        inactiveColor: Colors.grey,
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
