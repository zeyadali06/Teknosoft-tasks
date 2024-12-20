import 'package:e_commerce_app/Features/Cart_Feature/Presentation/Manager/Cart_View_Cubit/cart_view_cubit.dart';
import 'package:e_commerce_app/Core/Utils/App_Router.dart';
import 'package:e_commerce_app/Features/Favourate_Feature/Presentation/Manager/Favourate_View_Cubit/favourate_view_cubit.dart';
import 'package:e_commerce_app/Features/Search_Feature/Presentation/Manager/Search_View_Cubit.dart/search_view_cubit.dart';
import 'package:e_commerce_app/constants.dart';
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
      BlocProvider(
        create: (context) => SearchViewCubit(AppRouter.shoppingRepo)..getAllPoducts(),
        child: AppRouter.searchViewPath,
      ),
      BlocProvider(
        create: (context) => FavourateViewCubit(AppRouter.shoppingRepo)..getFavouratProducts(),
        child: AppRouter.favourateViewPath,
      ),
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
            icon: _buildIcon(Icons.search, selectedIndex == 2),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite_border_outlined, selectedIndex == 3),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person_outlined, selectedIndex == 4),
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
