import 'package:e_commerce_app/Features/Favourate_Feature/Presentation/Manager/Favourate_View_Cubit/favourate_view_cubit.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
