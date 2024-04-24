// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/SearchView.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.task,
  });

  final int task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('lists', style: Styles.black32Bold),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchView()));
                  },
                  child: Image.asset('assets/images/Screenshot 2024-04-24 213002.png', fit: BoxFit.fill, width: 30),
                ),
                const SizedBox(width: 30),
                const CircleAvatar(radius: 18, backgroundColor: Colors.black),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(backgroundColor: Colors.black, radius: 10),
            const SizedBox(width: 7),
            const Text("Today's Progress", style: Styles.blue12Bold),
            Text(" $task tasks left", style: Styles.grey12Bold),
          ],
        ),
      ],
    );
  }
}
