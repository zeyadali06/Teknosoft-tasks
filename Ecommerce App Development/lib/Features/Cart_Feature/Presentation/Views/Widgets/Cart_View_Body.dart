// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/No_Thing_Found.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Manager/Cart_View_Cubit/cart_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Widgets/Cart_View_Product_Item.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewCubit, CartViewState>(
      builder: (context, state) {
        if (state is CartViewLoading) {
          return const Center(child: CircularProgressIndicator(color: kPrimaryColor));
        } else if (state is CartViewEmpty) {
          return const NoThingFound(text: 'Cart is empty');
        } else if (state is CartViewFailed) {
          return NoThingFound(text: state.errMessage);
        } else {
          return Column(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Divider(color: Colors.grey.withOpacity(.2), height: 1),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 225 - kBottomNavigationBarHeight - 100,
                      child: ListView.separated(
                        itemCount: BlocProvider.of<CartViewCubit>(context).cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 15),
                            child: CartViewProductItem(item: BlocProvider.of<CartViewCubit>(context).cartItems[index]),
                          );
                        },
                        separatorBuilder: (BuildContext contextm, int index) {
                          return Divider(color: Colors.grey.withOpacity(.2), height: 1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 225,
                  padding: const EdgeInsets.only(left: kPadding, right: kPadding, top: kPadding),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          PriceRow(text: 'Subtotal :', price: BlocProvider.of<CartViewCubit>(context).subtotalPrice),
                          const SizedBox(height: 10),
                          PriceRow(text: 'Delivery Fee :', price: BlocProvider.of<CartViewCubit>(context).deliveryFeePrice),
                          const SizedBox(height: 10),
                          PriceRow(text: 'Discount :', price: BlocProvider.of<CartViewCubit>(context).discountPercentage, isPercentage: true),
                        ],
                      ),
                      PriceRow(text: 'Total :', price: BlocProvider.of<CartViewCubit>(context).totalPrice),
                      CustomButton(
                        onPressed: () async {
                          await BlocProvider.of<CartViewCubit>(context).checkOut();
                        },
                        buttonText: "Check out",
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.text, required this.price, this.isPercentage = false});

  final String text;
  final double price;
  final bool isPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Styles.grey12w500),
        if (isPercentage)
          Text(
            "${price.toStringAsFixed(2)}%",
            style: Styles.black14w500.copyWith(color: Colors.red),
          )
        else
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: Styles.black14w500,
          ),
      ],
    );
  }
}
