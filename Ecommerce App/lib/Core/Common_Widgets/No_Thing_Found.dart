import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class NoThingFound extends StatelessWidget {
  const NoThingFound({super.key, this.text = 'No Data Found...'});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Text(text, style: Styles.black18w500(context)),
      ),
    );
  }
}
