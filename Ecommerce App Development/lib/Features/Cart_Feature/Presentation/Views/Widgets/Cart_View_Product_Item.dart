// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Data/Models/Cart_Item_Model.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Manager/Cart_View_Cubit/cart_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewProductItem extends StatelessWidget {
  const CartViewProductItem({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - kPadding * 2,
      height: 80,
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: ProductImage(
                url: item.product.thumbnail,
                boxFit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width - (kPadding * 2) - 75 - 10 - 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.title, style: Styles.black14w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(item.product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                Row(
                  children: [
                    PricePart(product: item.product, firstPriceSize: 12, secondPriceSize: 10, asRow: false),
                    const SizedBox(width: 20),
                    Text("${item.numberOfItems.toString()} pieces", style: Styles.black18w500),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              await BlocProvider.of<CartViewCubit>(context).deleteFromCart(item.product);
            },
            child: Text('Remove from\n cart', style: Styles.black14w500.copyWith(color: Colors.red), textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
