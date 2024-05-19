// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.isFavourate, required this.product});

  final ProductModel product;
  final bool isFavourate;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final double width = 150;
  late bool fav;
  late Icon icon;
  static const Icon isPressedIcon = Icon(Icons.favorite, color: Colors.red);
  static const Icon isNotPressedIcon = Icon(Icons.favorite_outline_rounded, color: Colors.black);

  @override
  void initState() {
    if (widget.isFavourate) {
      icon = isPressedIcon;
    } else {
      icon = isNotPressedIcon;
    }
    fav = widget.isFavourate;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(AppRouter.goTo(context, AppRouter.productDetailsViewPath));
      },
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: AspectRatio(
                aspectRatio: 1.8 / 1,
                child: CachedNetworkImage(imageUrl: widget.product.images[0]),
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.product.title, style: Styles.black14w500, maxLines: 2, overflow: TextOverflow.ellipsis),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.category, style: Styles.grey12w500, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text("\$${widget.product.price}", style: Styles.black14w500),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      fav = !fav;
                      if (fav) {
                        icon = isPressedIcon;
                      } else {
                        icon = isNotPressedIcon;
                      }
                      setState(() {});
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
