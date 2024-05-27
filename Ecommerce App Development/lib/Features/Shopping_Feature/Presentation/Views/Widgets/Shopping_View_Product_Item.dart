// ignore_for_file: file_names, use_build_context_synchronously

import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ShoppingViewProductItem extends StatelessWidget {
  const ShoppingViewProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ProductModel? prod;
        await waitUntilFinished(context, () async {
          prod = await BlocProvider.of<ShoppingViewCubit>(context).getProduct(product.id);
        });
        if (prod != null) {
          Navigator.of(context).push(AppRouter.goTo(context, AppRouter.productDetailsViewPath(prod!)));
        }
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: AspectRatio(
                aspectRatio: 1.8 / 1,
                child: ProductImage(url: product.thumbnail),
              ),
            ),
            const SizedBox(height: 5),
            Text(product.title, style: Styles.black14w500.copyWith(fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                      PricePart(product: product, firstPriceSize: 13, secondPriceSize: 11),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
