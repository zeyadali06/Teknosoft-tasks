// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Description_Text_Product_Details_View.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Favourate_Icon_Button.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Images_Bar.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Number_Picker.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/constants.dart';
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
      color: const Color(0xfff6f6f6),
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
            selecetdIndex: imageIndex,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(kRadius), topRight: Radius.circular(kRadius)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product.title, style: Styles.white24Bold.copyWith(color: Colors.black, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: PricePart(widget: widget),
                                ),
                              ],
                            ),
                            FavourateIconButton(isPressed: widget.product.favourate)
                          ],
                        ),
                        DescriptionText(description: widget.product.description),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Row(
                      children: [
                        NumberPicker(
                          onNumberChanged: (number) {},
                          maxItemsInStock: widget.product.stock,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            onPressed: () {},
                            buttonText: 'Add to cart',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
