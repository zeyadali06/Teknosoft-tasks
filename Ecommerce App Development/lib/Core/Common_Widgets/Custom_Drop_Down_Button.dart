// ignore_for_file: file_names

import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key, required this.thingsToDisplay, required this.initialText, required this.onSelected});

  final String initialText;
  final List<String> thingsToDisplay;
  final void Function(String? value) onSelected;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      menuStyle: const MenuStyle(alignment: Alignment.topLeft),
      enabled: true,
      initialSelection: widget.initialText,
      dropdownMenuEntries: widget.thingsToDisplay.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry(
          value: value,
          label: value,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
            side: MaterialStateProperty.all(const BorderSide(width: .25)),
          ),
        );
      }).toList(),
      width: MediaQuery.of(context).size.width - (kPadding * 2),
      textStyle: const TextStyle(fontSize: 18),
      onSelected: (value) {
        setState(() {
          widget.onSelected(value);
        });
      },
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
    );
  }
}
