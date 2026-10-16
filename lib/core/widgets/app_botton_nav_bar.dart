import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_app/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/feature/profile/presentation/ui/profile_screen.dart';
import 'package:bookia_app/feature/wish_list/presentation/ui/wish_list_screen.dart';
import 'package:flutter/material.dart';

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
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.mainColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        activeIndex: currentIndex,
        gapLocation: GapLocation.none,
        activeColor: Colors.amber,
        inactiveColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
