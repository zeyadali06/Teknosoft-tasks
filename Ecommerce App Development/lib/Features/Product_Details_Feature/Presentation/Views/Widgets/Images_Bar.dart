// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class ImagesBar extends StatelessWidget {
  const ImagesBar({super.key, required this.product, required this.onImageSelected});

  final ProductModel product;
  final void Function(int imageIndex) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding),
      child: SizedBox(
        height: 75,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product.images.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: kPadding, right: (index == 4) ? kPadding : 0),
              child: GestureDetector(
                onTap: () {
                  onImageSelected(index);
                },
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.1),
                      radius: 34,
                      child: ProductImage(
                        url: product.images[index],
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
