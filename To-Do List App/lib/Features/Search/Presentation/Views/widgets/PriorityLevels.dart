import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/constants.dart';

class PriorityLevels extends StatelessWidget {
  const PriorityLevels({super.key, required this.pri, required this.onPriorityChanged});

  final Priority pri;
  final void Function(Priority p) onPriorityChanged;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = allPriorities(context);
    return Container(
      margin: const EdgeInsets.only(top: kPadding, right: kPadding, left: kPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 2, color: kPrimaryColor),
        borderRadius: BorderRadius.circular(kRaduis),
      ),
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onPriorityChanged(Priority.all[index]);
            },
            child: SizedBox(
              width: (((MediaQuery.of(context).size.width) - (kPadding * 2)) / Priority.all.length),
              child: widgets[index],
            ),
          );
        },
      ),
    );
  }

  List<Widget> allPriorities(BuildContext context) {
    List<Widget> widgets = [];
    for (Priority item in Priority.all) {
      Widget res;
      if (pri == item) {
        res = Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff5697a9), Color(0xff4b67b6)],
            ),
            borderRadius: BorderRadius.circular(kRaduis),
          ),
          alignment: Alignment.center,
          child: Text(item.name, style: Styles.blue18Bold.copyWith(color: Colors.white)),
        );
      } else {
        res = Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Text(item.name, style: Styles.blue18Bold),
        );
      }

      widgets.add(res);
    }
    return widgets;
  }
}
