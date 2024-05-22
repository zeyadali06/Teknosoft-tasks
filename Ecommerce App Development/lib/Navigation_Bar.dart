// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Manager/Cart_View_Cubit/cart_view_cubit.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  static List<Widget> pages = <Widget>[];

  @override
  void initState() {
    super.initState();

    pages = <Widget>[
      AppRouter.shoppingViewPath,
      BlocProvider(
        create: (context) => CartViewCubit(AppRouter.shoppingRepo)..getItemsInCart(),
        child: AppRouter.cartViewPath,
      ),
      AppRouter.favourateViewPath,
      AppRouter.profileSettingsViewPath,
    ];
  }

  Widget _buildIcon(IconData iconData, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: isSelected ? kPrimaryColor : const Color.fromRGBO(53, 53, 53, 1)),
        if (isSelected)
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 2),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color.fromRGBO(53, 53, 53, 1),
        backgroundColor: kPrimaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, selectedIndex == 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.trolley, selectedIndex == 1),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite_border_outlined, selectedIndex == 2),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person_outlined, selectedIndex == 3),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
