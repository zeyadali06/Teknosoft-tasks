import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/Features/Product_Details_Feature/Presentation/Views/Widgets/Product_Details_View_Body.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Products', style: Styles.black21w500(context)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfff6f6f6),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      body: ProductDetailsViewBody(product: product),
    );
  }
}
