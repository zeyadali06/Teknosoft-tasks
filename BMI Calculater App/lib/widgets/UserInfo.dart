// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.withOpacity(.2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(MyFlutterApp.male, size: 36),
              Text('Male', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('22', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22)),
              Text('Age', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('164', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22)),
              Text('Height', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('52', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22)),
              Text('Weight', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          )
        ],
      ),
    );
  }
}
