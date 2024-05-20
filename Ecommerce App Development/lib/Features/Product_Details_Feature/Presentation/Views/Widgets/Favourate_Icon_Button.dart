// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FavourateIconButton extends StatefulWidget {
  const FavourateIconButton({super.key, required this.isPressed});

  final bool isPressed;

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
    );
  }
}
