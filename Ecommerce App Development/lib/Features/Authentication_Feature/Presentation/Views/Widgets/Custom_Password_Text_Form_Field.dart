// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:e_commerce_app_development/constants.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    this.controller,
    this.onSaved,
  });

  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordTextFormField> createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  Color color = Colors.grey;
  bool foucsed = false;
  late bool obsecureText;
  late IconData eyeIcon;

  @override
  void initState() {
    obsecureText = true;
    eyeIcon = Icons.remove_red_eye_outlined;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) {
        foucsed = focus;
        if (color != Colors.red) {
          color = focus ? kPrimaryColor : Colors.grey;
          setState(() {});
        }
      },
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            color = Colors.red;
            setState(() {});
            return "field is required";
          } else if (foucsed) {
            color = kPrimaryColor;
            setState(() {});
          }
          return null;
        },
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        obscureText: obsecureText,
        onSaved: widget.onSaved,
        cursorOpacityAnimates: true,
        controller: widget.controller,
        cursorColor: color,
        decoration: InputDecoration(
          border: outlineInputBorder(2),
          enabledBorder: outlineInputBorder(1.5),
          focusedBorder: outlineInputBorder(2),
          errorBorder: outlineInputBorder(2),
          suffixIcon: IconButton(
            onPressed: () {
              obsecureText = !obsecureText;
              if (eyeIcon == Icons.remove_red_eye_outlined) {
                eyeIcon = Icons.remove_red_eye;
              } else {
                eyeIcon = Icons.remove_red_eye_outlined;
              }
              setState(() {});
            },
            icon: Icon(eyeIcon),
          ),
          hintText: 'Password',
          labelStyle: TextStyle(color: color),
          label: const Text('Password'),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(double width) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(kRadius)),
      borderSide: BorderSide(width: width, color: color),
    );
  }
}
