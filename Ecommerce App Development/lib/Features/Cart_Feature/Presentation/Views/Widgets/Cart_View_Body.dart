// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Widgets/Cart_View_Product_Item.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Divider(color: Colors.grey.withOpacity(.2), height: 1),
          SizedBox(
            height: MediaQuery.of(context).size.height - 147,
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 15),
                  child: CartViewProductItem(
                    product: ProductModel(
                      rating: 123,
                      id: 1,
                      price: 100,
                      stock: 2,
                      brand: "cjowijcf",
                      category: "Women's Shoes",
                      thumbnail: "https://cdn.dummyjson.com/product-images/1/1.jpg",
                      images: ["https://cdn.dummyjson.com/product-images/1/1.jpg"],
                      discountPercentage: 20,
                      description: ",cwl,cw",
                      title: "Nike Blazer Mid '77",
                      favourate: true,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext contextm, int index) {
                return Divider(color: Colors.grey.withOpacity(.2), height: 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
