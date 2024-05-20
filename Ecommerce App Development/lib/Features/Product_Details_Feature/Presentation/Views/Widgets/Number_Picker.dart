// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({super.key, required this.onNumberChanged, required this.maxItemsInStock});

  final void Function(int number) onNumberChanged;
  final int maxItemsInStock;

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late int value;

  @override
  void initState() {
    value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xfff6f6f6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (value > 1) {
                value -= 1;
                setState(() {});
                widget.onNumberChanged(value);
              }
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(Icons.remove, color: Colors.black, size: 18),
              ),
            ),
          ),
          Text(value.toString()),
          GestureDetector(
            onTap: () {
              if (value < widget.maxItemsInStock) {
                value += 1;
                setState(() {});
                widget.onNumberChanged(value);
              } else {
                showSnackBar(context, 'The stock contains only ${widget.maxItemsInStock} peices.');
              }
            },
            child: const CircleAvatar(
              backgroundColor: Colors.black,
              child: Center(
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
