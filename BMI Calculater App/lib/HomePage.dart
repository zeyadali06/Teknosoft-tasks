// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'BMI Calculator',
                style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Gender',
                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ),
              Center(
                child: Text(
                  'Height (cm)',
                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Age',
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Weight (kg)',
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
