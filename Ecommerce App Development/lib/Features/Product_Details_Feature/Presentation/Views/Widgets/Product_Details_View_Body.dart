// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Images_Bar.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late int imageIndex;

  @override
  void initState() {
    imageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.1),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 - 150,
            child: ProductImage(url: widget.product.images[imageIndex]),
          ),
          ImagesBar(
            product: widget.product,
            onImageSelected: (index) {
              imageIndex = index;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
