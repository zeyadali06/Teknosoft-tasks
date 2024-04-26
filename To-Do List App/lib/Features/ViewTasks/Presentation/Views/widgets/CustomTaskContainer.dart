// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/HourMinuteFormate.dart';
import 'package:todo_list_app/Core/CommonWidgets/ImportantStar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCheckBox.dart';
import 'package:todo_list_app/constants.dart';

class CustomTaskContainer extends StatelessWidget {
  const CustomTaskContainer({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRaduis)),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15),
        tileColor: const Color(0xfffcfdff),
        leading: CustomCheckBox(
          initStateIsChecked: task.finished,
          onPressed: () async {
            task.finished = !(task.finished);
            await editData(task);
          },
        ),
        trailing: ImportantStar(
          onPressed: () async {
            task.important = !(task.important);
            await editData(task);
          },
          initStateIsChecked: task.important,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: Styles.blue18Bold),
            const SizedBox(height: 5),
            Text("${hourMinuteFormate(task.from)} - ${hourMinuteFormate(task.to)}", style: Styles.grey12Bold),
            const SizedBox(height: 7),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: Category.find(task.category)!.gradient),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(width: 10),
                Text(Category.find(task.category)!.name, style: Styles.grey12Bold.copyWith(fontSize: 14, color: const Color(0xff6d6d6d))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
