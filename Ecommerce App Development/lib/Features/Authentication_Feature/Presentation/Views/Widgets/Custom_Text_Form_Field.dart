import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce_app_development/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    this.controller,
    this.onSaved,
    this.inputFormatters,
    this.onChanged,
  });

  final String hintText;
  final String label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

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
        onChanged: widget.onChanged,
        cursorOpacityAnimates: true,
        controller: widget.controller,
        cursorColor: color,
        inputFormatters: widget.inputFormatters,
        style: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
        decoration: InputDecoration(
          border: outlineInputBorder(2),
          enabledBorder: outlineInputBorder(1.5),
          focusedBorder: outlineInputBorder(2),
          errorBorder: outlineInputBorder(2),
          hintText: widget.hintText,
          labelStyle: TextStyle(color: color, fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          hintStyle: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          errorStyle: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          label: Text(widget.label),
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
