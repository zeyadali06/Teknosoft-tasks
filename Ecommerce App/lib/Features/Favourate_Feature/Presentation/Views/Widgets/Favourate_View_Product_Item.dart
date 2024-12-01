import 'package:e_commerce_app/Features/Favourate_Feature/Presentation/Views/Widgets/Favourate_Icon.dart';
import 'package:e_commerce_app/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app/Core/Common_Widgets/Scale_Down.dart';
import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class FavourateViewProductItem extends StatelessWidget {
  const FavourateViewProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScaleDown(
          flex: 2,
          child: Container(
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: ProductImage(
                url: product.thumbnail,
                boxFit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title, style: Styles.black14w500(context), maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(product.category, style: Styles.grey12w500(context), maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              PricePart(product: product, firstPriceSize: 16, secondPriceSize: 10),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ScaleDown(child: FavourateIcon(isPressed: product.favourate, product: product)),
      ],
    );
  }
}
