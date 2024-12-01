import 'package:e_commerce_app/Core/Common_Widgets/Scale_Down.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:e_commerce_app/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app/Core/Utils/App_Router.dart';
import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ShoppingViewProductItem extends StatelessWidget {
  const ShoppingViewProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ProductModel? prod;
        await waitUntilFinished(context, () async {
          prod = await BlocProvider.of<ShoppingViewCubit>(context).getProduct(product.id);
        });
        if (prod != null) {
          if (context.mounted) {
            Navigator.of(context).push(AppRouter.goTo(context, AppRouter.productDetailsViewPath(prod!)));
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: AspectRatio(
                aspectRatio: 1.8 / 1,
                child: ProductImage(url: product.thumbnail),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ScaleDown(
            child: Text(
              product.title,
              style: Styles.black14w500(context).copyWith(fontSize: getResponsiveFontSize(context: context, fontSize: 13)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ScaleDown(
            child: Text(
              product.category,
              style: Styles.grey12w500(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ScaleDown(
            child: PricePart(
              product: product,
              firstPriceSize: 13,
              secondPriceSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
