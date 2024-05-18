// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Product_Item.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Section_Title.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class ShoppingViewBody extends StatelessWidget {
  const ShoppingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Shopping', style: Styles.black21w500),
            const ShoppingViewImage(),
            const TitleRow(leftText: 'New Arrival', rightText: 'See all'),
            SizedBox(
              height: 172,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: kPadding, right: (index == 4) ? kPadding : 0),
                    child: const ProductItem(
                      name: "Nike Blazer Low '77 Jumbo",
                      category: "Women's Shoes",
                      imagePath: "https",
                      isFavourate: true,
                      price: 120.11,
                    ),
                  );
                },
              ),
            ),
            const TitleRow(leftText: 'Best Seller', rightText: 'See all'),
            Padding(
              padding: const EdgeInsets.only(right: kPadding),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: kPadding),
                    child: ProductItem(
                      name: "Nike Blazer Low '77 Jumbo",
                      category: "Women's Shoes",
                      imagePath: "https",
                      isFavourate: true,
                      price: 120.11,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
