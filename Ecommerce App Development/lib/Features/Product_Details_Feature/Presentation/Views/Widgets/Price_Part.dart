// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Product_Details_View_Body.dart';
import 'package:flutter/material.dart';

class PricePart extends StatelessWidget {
  const PricePart({
    super.key,
    required this.widget,
  });

  final ProductDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.product.discountPercentage != 0)
          Text(
            "\$${(widget.product.price * ((100 - widget.product.discountPercentage) / 100)).toStringAsFixed(2)}",
            style: Styles.black21w500,
          )
        else
          Text(widget.product.price.toStringAsFixed(2)),
        const SizedBox(width: 10),
        if (widget.product.discountPercentage != 0)
          Text(
            "\$${widget.product.price.toStringAsFixed(2)}",
            style: Styles.black14w500.copyWith(
              color: Colors.red,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationThickness: 2,
            ),
          ),
      ],
    );
  }
}
