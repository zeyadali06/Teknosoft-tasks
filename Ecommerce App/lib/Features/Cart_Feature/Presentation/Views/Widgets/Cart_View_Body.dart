import 'package:e_commerce_app/Features/Cart_Feature/Presentation/Manager/Cart_View_Cubit/cart_view_cubit.dart';
import 'package:e_commerce_app/Features/Cart_Feature/Presentation/Views/Widgets/Cart_View_Product_Item.dart';
import 'package:e_commerce_app/Core/Common_Widgets/No_Thing_Found.dart';
import 'package:e_commerce_app/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app/Features/Cart_Feature/Presentation/Views/Widgets/Price_Row.dart';
import 'package:e_commerce_app/constants.dart';
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
              Expanded(
                child: SafeArea(
                  child: Column(
                    children: [
                      Divider(color: Colors.grey.withOpacity(.2), height: 1),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: BlocProvider.of<CartViewCubit>(context).cartItems.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(color: Colors.grey.withOpacity(.2), height: 1);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 15),
                              child: CartViewProductItem(
                                item: BlocProvider.of<CartViewCubit>(context).cartItems[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: kPadding, right: kPadding),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        PriceRow(text: 'Subtotal :', price: BlocProvider.of<CartViewCubit>(context).subtotalPrice),
                        const SizedBox(height: 5),
                        PriceRow(text: 'Delivery Fee :', price: BlocProvider.of<CartViewCubit>(context).deliveryFeePrice),
                        const SizedBox(height: 5),
                        PriceRow(text: 'Discount :', price: BlocProvider.of<CartViewCubit>(context).discountPercentage, isPercentage: true),
                        const SizedBox(height: 5),
                        PriceRow(text: 'Total :', price: BlocProvider.of<CartViewCubit>(context).totalPrice),
                        const SizedBox(height: 15),
                        CustomButton(
                          onPressed: () async {
                            await BlocProvider.of<CartViewCubit>(context).checkOut();
                          },
                          buttonText: "Check Out",
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
