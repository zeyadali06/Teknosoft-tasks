import 'package:e_commerce_app/Core/Common_Widgets/Scale_Down.dart';
import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ScaleDown(child: Text(text, style: Styles.black21w500(context))),
        ],
      ),
    );
  }
}
