// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Widgets/Cart_View_Body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartViewBody(),
    );
  }
}