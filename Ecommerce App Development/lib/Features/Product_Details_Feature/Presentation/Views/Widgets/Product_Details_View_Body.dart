// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Manager/Product_Details_Cubit/product_details_cubit.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Description_Text_Product_Details_View.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Favourate_Icon_Button.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Number_Picker.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Images_Bar.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late int imageIndex;
  late int numberOfItems;

  @override
  void initState() {
    imageIndex = 0;
    numberOfItems = widget.product.itemsInCart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is ProductDetailsCartNOItemsEqualZero) {
          showSnackBar(context, "Please, enter a number.");
        } else if (state is ProductDetailsCartSuccessed) {
          showSnackBar(context, "Items added to cart successfully");
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
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
                            Text(widget.product.title, style: Styles.white24Bold(context).copyWith(color: Colors.black, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.product.category, style: Styles.grey12w500(context), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: PricePart(product: widget.product),
                                    ),
                                  ],
                                ),
                                FavourateIconButton(product: widget.product, isPressed: widget.product.favourate)
                              ],
                            ),
                            DescriptionText(description: widget.product.description),
                          ],
                        ),
                      ),
                      if (widget.product.stock == 0)
                        Padding(
                          padding: const EdgeInsets.only(bottom: kPadding),
                          child: Text('Out of stock', style: Styles.black18w500(context).copyWith(color: Colors.red)),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(kPadding),
                          child: Row(
                            children: [
                              NumberPicker(
                                onNumberChanged: (number) {
                                  numberOfItems = number;
                                },
                                initNumberOfItems: widget.product.itemsInCart,
                                maxItemsInStock: widget.product.stock,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () async {
                                    await waitUntilFinished(context, () async => await BlocProvider.of<ProductDetailsCubit>(context).addToCart(widget.product, numberOfItems));
                                  },
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
      },
    );
  }
}
