import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';

class RowOfTaskLevel extends StatelessWidget {
  const RowOfTaskLevel({super.key, required this.myDayTasks, required this.imagePath, required this.text, required this.screenPath, required this.onPop});

  final int myDayTasks;
  final String imagePath;
  final String text;
  final String screenPath;
  final void Function() onPop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(screenPath);
          onPop();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 25),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(text, style: Styles.blue18Bold),
                const SizedBox(height: 6),
                Text('$myDayTasks tasks', style: Styles.grey12Bold),
                const SizedBox(height: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
