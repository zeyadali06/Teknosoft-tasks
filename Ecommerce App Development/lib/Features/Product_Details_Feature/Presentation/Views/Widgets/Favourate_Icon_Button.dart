import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Manager/Product_Details_Cubit/product_details_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavourateIconButton extends StatefulWidget {
  const FavourateIconButton({super.key, required this.product, required this.isPressed});

  final bool isPressed;
  final ProductModel product;

  @override
  State<FavourateIconButton> createState() => _FavourateIconButtonState();
}

class _FavourateIconButtonState extends State<FavourateIconButton> {
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
          await waitUntilFinished(context, () async => await BlocProvider.of<ProductDetailsCubit>(context).changeFavourateStatus(widget.product, fav));
          setState(() {});
        },
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.grey.withOpacity(.5)),
          backgroundColor: WidgetStatePropertyAll(Colors.grey.withOpacity(.1)),
        ),
        color: const Color(0xfff6f6f7),
        iconSize: 20,
        icon: icon,
      ),
    );
  }
}
