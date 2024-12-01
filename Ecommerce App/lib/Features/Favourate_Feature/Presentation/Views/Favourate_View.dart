import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/Features/Favourate_Feature/Presentation/Views/Widgets/Favourate_View_Body.dart';
import 'package:flutter/material.dart';

class FavourateView extends StatelessWidget {
  const FavourateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourate Products', style: Styles.black21w500(context)),
        centerTitle: true,
      ),
      body: const FavourateViewBody(),
    );
  }
}
