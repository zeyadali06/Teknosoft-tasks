import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class ShoppingViewImage extends StatelessWidget {
  const ShoppingViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.8),
            offset: const Offset(0, 5),
            blurRadius: 15,
          )
        ],
      ),
      width: MediaQuery.of(context).size.width - kPadding * 2,
      child: AspectRatio(
        aspectRatio: 2.9 / 1,
        child: Image.asset(
          "assets/images/ShoppingViewHeader.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
