// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Core/Utils/Countries_Codes.dart';
import 'package:e_commerce_app_development/Core/Utils/formatters.dart';
import 'package:flutter/material.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  late Country selectedCountryCode;
  late String countryCode;
  late String phoneNumber;

  @override
  void initState() {
    selectedCountryCode = countries[0];
    countryCode = "";
    phoneNumber = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          DropdownButton<Country>(
            value: selectedCountryCode,
            onChanged: (Country? newValue) {
              selectedCountryCode = newValue!;
              countryCode = selectedCountryCode.code;
              widget.controller.text = "$countryCode$phoneNumber";
              setState(() {});
            },
            items: countries.map<DropdownMenuItem<Country>>((Country value) {
              return DropdownMenuItem<Country>(
                value: value,
                child: Row(
                  children: [
                    Text("${value.code}  ${value.nickName} ${value.flag}"),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomTextFormField(
              hintText: "Phone",
              label: "Phone",
              inputFormatters: [Formatters.numbersOnly],
              onChanged: (value) {
                phoneNumber = value!;
                widget.controller.text = "$countryCode$phoneNumber";
              },
            ),
          ),
        ],
      ),
    );
  }
}
