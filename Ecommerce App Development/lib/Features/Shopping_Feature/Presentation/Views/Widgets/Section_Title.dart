// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.rightText, required this.leftText});

  final String rightText;
  final String leftText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftText, style: Styles.black21w500),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 60,
              height: 40,
              child: Center(
                child: Text(rightText, style: Styles.grey12w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
