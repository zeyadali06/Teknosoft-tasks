import 'package:e_commerce_app_development/Core/Common_Widgets/Scale_Down.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.text, required this.price, this.isPercentage = false});

  final String text;
  final double price;
  final bool isPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScaleDown(
          child: Text(text, style: Styles.grey12w500(context)),
        ),
        const SizedBox(width: 10),
        if (isPercentage)
          ScaleDown(
            child: Text(
              "${price.toStringAsFixed(2)}%",
              style: Styles.black14w500(context).copyWith(color: Colors.red),
            ),
          )
        else
          ScaleDown(
            child: Text(
              "\$${price.toStringAsFixed(2)}",
              style: Styles.black14w500(context),
            ),
          ),
      ],
    );
  }
}
