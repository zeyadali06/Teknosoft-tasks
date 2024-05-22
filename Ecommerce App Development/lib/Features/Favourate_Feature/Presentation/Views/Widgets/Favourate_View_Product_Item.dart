// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentation/Manager/Favourate_View_Cubit/favourate_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Widgets/Price_Part.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavourateViewProductItem extends StatelessWidget {
  const FavourateViewProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - kPadding * 2,
      height: 80,
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: ProductImage(
                url: product.thumbnail,
                boxFit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width - (kPadding * 2) - 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: Styles.black14w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                Row(
                  children: [
                    PricePart(product: product, firstPriceSize: 16, secondPriceSize: 10),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          FavourateIcon(isPressed: product.favourate, product: product),
        ],
      ),
    );
  }
}

class FavourateIcon extends StatefulWidget {
  const FavourateIcon({super.key, required this.isPressed, required this.product});

  final bool isPressed;
  final ProductModel product;

  @override
  State<FavourateIcon> createState() => _FavourateIconState();
}

class _FavourateIconState extends State<FavourateIcon> {
  static const Icon isPressedIcon = Icon(Icons.favorite, color: Colors.red);
  static const Icon isNotPressedIcon = Icon(Icons.favorite_outline_rounded, color: Colors.black);
  late bool fav;
  late Icon icon;

  @override
  void initState() {
    if (widget.isPressed) {
      icon = isPressedIcon;
    } else {
      icon = isNotPressedIcon;
    }
    fav = widget.isPressed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.transparent,
      child: IconButton(
        onPressed: () async {
          fav = !fav;
          if (fav) {
            icon = isPressedIcon;
          } else {
            icon = isNotPressedIcon;
          }
          await BlocProvider.of<FavourateViewCubit>(context).changeFavourateStatus(widget.product, fav);
          // setState(() {});
        },
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(.5)),
          backgroundColor: MaterialStatePropertyAll(Colors.grey.withOpacity(.1)),
        ),
        color: const Color(0xfff6f6f7),
        iconSize: 20,
        icon: icon,
      ),
    );
  }
}
