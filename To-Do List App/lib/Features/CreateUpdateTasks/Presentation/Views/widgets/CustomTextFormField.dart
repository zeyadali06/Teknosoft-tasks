// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    // required this.prefixIcon,
    // required this.suffixIcon,
    required this.controller,
    this.onSaved,
    this.inputFormatters,
  });

  final String hintText;
  // final IconData prefixIcon;
  // final IconData suffixIcon;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Color color = Colors.grey;
  bool foucsed = false;

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
        onSaved: widget.onSaved,
        cursorOpacityAnimates: true,
        controller: widget.controller,
        cursorColor: color,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          border: outlineInputBorder(2),
          enabledBorder: outlineInputBorder(1.5),
          focusedBorder: outlineInputBorder(2),
          errorBorder: outlineInputBorder(2),
          hintText: widget.hintText,
          hintStyle: Styles.white18w500.copyWith(color: color, fontSize: 16),
          label: Text(widget.hintText, style: Styles.white18w500.copyWith(color: color, fontSize: 16)),
          // prefixIcon: Icon(widget.prefixIcon, color: color),
          // suffixIcon: IconButton(
          //   color: color,
          //   icon: Icon(widget.suffixIcon),
          //   onPressed: () {
          //     widget.controller.clear();
          //   },
          // ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(double width) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(kPadding)),
      borderSide: BorderSide(width: width, color: color),
    );
  }
}
