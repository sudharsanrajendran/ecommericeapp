import 'package:ecommericeapp/main_screens/WishList_screen/Wishlist_screen.dart';
import 'package:ecommericeapp/main_screens/profile_Screen/profile_screen.dart';
import 'package:ecommericeapp/main_screens/Shop_screen/shop_screen.dart';
import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'features/push_notification/pushnotification_api.dart';
import 'main_screens/Home_screen/Home_screens.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomeScreen(),
    ShopScreen(),
    WishlistScreen(),
   ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final dark=Thelper.isdarkmode(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(

        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        selectedItemColor: dark?Colors.grey:Colors.black,
        unselectedItemColor: dark?Colors.white:Colors.black38,
        selectedFontSize: 14,
        unselectedFontSize: 12,
      ),
    );
  }
}
