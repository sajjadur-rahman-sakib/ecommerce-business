import 'package:ecommerce/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final BottomNavBarController _navBarController =
      Get.find<BottomNavBarController>();

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CategoryListScreen(),
    const CategoryListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (_) {
      return Scaffold(
        body: _screens[_navBarController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _navBarController.selectedIndex,
          onDestinationSelected: _navBarController.changeIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              label: 'Wishlist',
            ),
          ],
        ),
      );
    });
  }
}
