// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class CartViewProductItem extends StatelessWidget {
  const CartViewProductItem({super.key, required this.product});

  final ProductModel product;

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
                url: product.thumbnail,
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
                Text(product.title, style: Styles.black14w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                Text("\$${product.price}", style: Styles.black14w500.copyWith(fontSize: 16)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Remove from\n cart', style: Styles.black14w500.copyWith(color: Colors.red), textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
