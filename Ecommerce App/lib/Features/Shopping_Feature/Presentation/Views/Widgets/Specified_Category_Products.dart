import 'package:e_commerce_app/Core/Common_Widgets/No_Thing_Found.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Product_Item.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class SpecifiedCategoryProducts extends StatelessWidget {
  const SpecifiedCategoryProducts({super.key, required this.specificCategoryProducts});

  final List<ProductModel> specificCategoryProducts;

  @override
  Widget build(BuildContext context) {
    return specificCategoryProducts.isEmpty
        ? const NoThingFound()
        : Padding(
            padding: const EdgeInsets.only(right: kPadding),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: specificCategoryProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: kPadding),
                  child: ShoppingViewProductItem(
                    product: specificCategoryProducts[index],
                  ),
                );
              },
            ),
          );
  }
}
