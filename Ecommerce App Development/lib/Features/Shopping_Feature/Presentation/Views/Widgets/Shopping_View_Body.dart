// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Product_Item.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Section_Title.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingViewBody extends StatefulWidget {
  const ShoppingViewBody({super.key});

  @override
  State<ShoppingViewBody> createState() => _ShoppingViewBodyState();
}

class _ShoppingViewBodyState extends State<ShoppingViewBody> {
  late List<ProductModel> products;
  late List<String> brands;
  late List<ProductModel> specificBrandProducts;

  @override
  void initState() {
    products = BlocProvider.of<ShoppingViewCubit>(context).avaliableProducts;
    brands = BlocProvider.of<ShoppingViewCubit>(context).allBrands;
    specificBrandProducts = BlocProvider.of<ShoppingViewCubit>(context).specificBrandProducts;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text('Shopping', style: Styles.black21w500),
            const SizedBox(height: 30),
            const ShoppingViewImage(),
            const TitleRow(leftText: 'Available', rightText: 'See all'),
            SizedBox(
              height: 172,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: kPadding, right: (index == 4) ? kPadding : 0),
                    child: ProductItem(
                      product: products[index],
                      isFavourate: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            const TitleRow(leftText: 'Brands', rightText: 'See all'),
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
                  return Padding(
                    padding: const EdgeInsets.only(left: kPadding),
                    child: ProductItem(
                      product: specificBrandProducts[index],
                      isFavourate: true,
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
