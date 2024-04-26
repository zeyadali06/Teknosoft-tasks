// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/ImportantStar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCheckBox.dart';
import 'package:todo_list_app/constants.dart';

class CustomTaskContainer extends StatelessWidget {
  const CustomTaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRaduis)),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15),
        tileColor: const Color(0xfffcfdff),
        leading: const CustomCheckBox(),
        trailing: const ImportantStar(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weekly meeting', style: Styles.blue18Bold),
            const SizedBox(height: 5),
            const Text('14:00 - 14:30', style: Styles.grey12Bold),
            const SizedBox(height: 7),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: Category.Personal.gradient),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(width: 10),
                Text('Work', style: Styles.grey12Bold.copyWith(fontSize: 14, color: const Color(0xff6d6d6d))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
