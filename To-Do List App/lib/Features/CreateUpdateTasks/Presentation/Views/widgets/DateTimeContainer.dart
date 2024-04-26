// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/constants.dart';

class DateTimeContainer extends StatelessWidget {
  const DateTimeContainer({super.key, required this.datetime});

  final DateTime? datetime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(BorderSide(width: 1.5, color: Colors.grey)),
          borderRadius: BorderRadius.circular(kRaduis),
        ),
        child: Center(
          child: Text(
            datetime == null
                ? ""
                : "${datetime!.day}-${datetime!.month}-${datetime!.year}   ${datetime!.hour >= 10 ? datetime!.hour : "0${datetime!.hour}"}:${datetime!.minute >= 10 ? datetime!.minute : "0${datetime!.minute}"}",
            style: Styles.blue18Bold.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
