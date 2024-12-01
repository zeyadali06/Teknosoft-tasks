import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Scale_Down.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Data/Models/Cart_Item_Model.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Manager/Cart_View_Cubit/cart_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewProductItem extends StatelessWidget {
  const CartViewProductItem({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScaleDown(
          child: Container(
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: ProductImage(
                url: item.product.thumbnail,
                boxFit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.product.title, style: Styles.black14w500(context), maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(item.product.category, style: Styles.grey12w500(context), maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Row(
                children: [
                  ScaleDown(
                    flex: 4,
                    child: PricePart(product: item.product, firstPriceSize: 12, secondPriceSize: 10, asRow: false),
                  ),
                  const SizedBox(width: 20),
                  ScaleDown(
                    child: Text(item.numberOfItems.toString(), style: Styles.black18w500(context)),
                  ),
                  ScaleDown(
                    flex: 5,
                    child: Text(" pieces", style: Styles.black14w500(context)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ScaleDown(
          child: GestureDetector(
            onTap: () async {
              await BlocProvider.of<CartViewCubit>(context).deleteFromCart(item.product);
            },
            child: const Icon(Icons.delete, color: Colors.red),
          ),
        )
      ],
    );
  }
}
