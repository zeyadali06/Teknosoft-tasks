// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class NoThingFound extends StatelessWidget {
  const NoThingFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text('No Data Found...', style: Styles.black18w500),
      ),
    );
  }
}
