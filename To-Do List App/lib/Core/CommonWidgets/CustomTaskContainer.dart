import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/HourMinuteFormate.dart';
import 'package:todo_list_app/Core/CommonWidgets/ImportantStar.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCheckBox.dart';
import 'package:todo_list_app/constants.dart';

class CustomTaskContainer extends StatefulWidget {
  const CustomTaskContainer({super.key, required this.task, this.onDismissed, this.onPop, required this.hiveServices});

  final HiveServices hiveServices;
  final TaskModel task;
  final Future<void> Function(DismissDirection direction)? onDismissed;
  final void Function()? onPop;

  @override
  State<CustomTaskContainer> createState() => _CustomTaskContainerState();
}

class _CustomTaskContainerState extends State<CustomTaskContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).pushNamed(AppRoutes.kUpdateTaskPath, arguments: widget.task);
        widget.onPop?.call();
        setState(() {});
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 93,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(kRaduis), color: Colors.red),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Delete Task ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                Icon(Icons.delete, color: Colors.white),
              ],
            ),
          ),
          Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            onDismissed: widget.onDismissed,
            child: CardContent(
              task: widget.task,
              hiveServices: widget.hiveServices,
              customCheckBoxOnPressed: () {
                setState(() {});
              },
              importantStarOnPressed: () async {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.task, required this.customCheckBoxOnPressed, required this.importantStarOnPressed, required this.hiveServices});

  final TaskModel task;
  final void Function() customCheckBoxOnPressed;
  final void Function() importantStarOnPressed;
  final HiveServices hiveServices;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRaduis)),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15),
        tileColor: const Color(0xfffcfdff),
        leading: CustomCheckBox(
          isChecked: task.finished,
          onPressed: () async {
            task.finished = !task.finished;
            if (task.finished) {
              task.finishDate = DateTime.now();
            } else {
              task.finishDate = null;
            }
            await hiveServices.editData(task);
            customCheckBoxOnPressed.call();
          },
        ),
        trailing: ImportantStar(
          isChecked: task.important,
          onPressed: () async {
            task.important = !task.important;
            await hiveServices.editData(task);
            importantStarOnPressed.call();
          },
        ),
        title: CustomTaskContainerContent(task: task),
      ),
    );
  }
}

class CustomTaskContainerContent extends StatelessWidget {
  const CustomTaskContainerContent({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(task.title, style: Styles.blue18Bold),
        const SizedBox(height: 5),
        Text(
          "${task.from.day}/${task.from.month}/${task.from.year}   ${hourMinuteFormate(task.from)}\n${task.to.day}/${task.to.month}/${task.to.year}   ${hourMinuteFormate(task.to)}   ",
          style: Styles.grey12Bold,
        ),
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
    );
  }
}
