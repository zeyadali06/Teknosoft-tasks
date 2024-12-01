// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Widgets/Cart_View_Body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: Styles.black21w500(context)),
        centerTitle: true,
      ),
      body: const CartViewBody(),
    );
  }
}
