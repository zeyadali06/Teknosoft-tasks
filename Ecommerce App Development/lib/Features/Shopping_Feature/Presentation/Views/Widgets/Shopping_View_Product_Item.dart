// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';

class ShoppingViewProductItem extends StatelessWidget {
  const ShoppingViewProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(AppRouter.goTo(context, AppRouter.productDetailsViewPath));
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
                child: CachedNetworkImage(imageUrl: product.images[0]),
              ),
            ),
            const SizedBox(height: 10),
            Text(product.title, style: Styles.black14w500, maxLines: 2, overflow: TextOverflow.ellipsis),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text("\$${product.price}", style: Styles.black14w500),
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
