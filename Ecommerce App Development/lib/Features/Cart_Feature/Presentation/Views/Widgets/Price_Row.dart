// ignore_for_file: file_names

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
        Text(text, style: Styles.grey12w500),
        if (isPercentage)
          Text(
            "${price.toStringAsFixed(2)}%",
            style: Styles.black14w500.copyWith(color: Colors.red),
          )
        else
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: Styles.black14w500,
          ),
      ],
    );
  }
}
