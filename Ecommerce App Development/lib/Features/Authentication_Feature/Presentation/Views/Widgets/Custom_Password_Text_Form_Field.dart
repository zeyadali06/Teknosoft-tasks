import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_development/constants.dart';

class CustomObsecureTextFormField extends StatefulWidget {
  const CustomObsecureTextFormField({
    super.key,
    this.controller,
    this.onSaved,
  });

  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  State<CustomObsecureTextFormField> createState() => _CustomObsecureTextFormFieldState();
}

class _CustomObsecureTextFormFieldState extends State<CustomObsecureTextFormField> {
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
        style: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
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
          labelStyle: TextStyle(color: color, fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          hintStyle: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          errorStyle: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
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
