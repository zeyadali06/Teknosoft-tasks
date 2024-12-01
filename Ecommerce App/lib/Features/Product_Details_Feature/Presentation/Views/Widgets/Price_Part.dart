import 'package:e_commerce_app/Core/Common_Widgets/Scale_Down.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';

class PricePart extends StatelessWidget {
  const PricePart({super.key, required this.product, this.firstPriceSize = 21, this.secondPriceSize = 14, this.asRow = true});

  final ProductModel product;
  final double firstPriceSize;
  final double secondPriceSize;
  final bool asRow;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      if (product.discountPercentage != 0)
        ScaleDown(
          child: Text(
            "\$${(product.price * ((100 - product.discountPercentage) / 100)).toStringAsFixed(2)}",
            style: Styles.black21w500(context).copyWith(fontSize: getResponsiveFontSize(context: context, fontSize: firstPriceSize)),
          ),
        )
      else
        ScaleDown(
          child: Text(product.price.toStringAsFixed(2)),
        ),
      const SizedBox(width: 10),
      if (product.discountPercentage != 0)
        ScaleDown(
          child: Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: Styles.black14w500(context).copyWith(
              color: Colors.red,
              fontSize: getResponsiveFontSize(context: context, fontSize: secondPriceSize),
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationThickness: 2,
            ),
          ),
        ),
    ];

    if (asRow) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      );
    }
  }
}
