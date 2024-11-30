import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/CreateTaskCubit/create_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/DateTimeContainer.dart';
import 'package:todo_list_app/constants.dart';

class CreateTaskEnterDateAndTimeField extends StatefulWidget {
  const CreateTaskEnterDateAndTimeField({super.key});

  @override
  State<CreateTaskEnterDateAndTimeField> createState() => _CreateTaskEnterDateAndTimeFieldState();
}

class _CreateTaskEnterDateAndTimeFieldState extends State<CreateTaskEnterDateAndTimeField> {
  late DateTime from;
  late DateTime to;
  bool showFromDateTime = false;
  bool showToDateTime = false;

  @override
  void initState() {
    from = to = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Start time:   ', style: Styles.blue18Bold.copyWith(color: Colors.black)),
            DateTimeContainer(datetime: showFromDateTime ? from : null),
          ],
        ),
        MaterialButton(
          onPressed: () async {
            DateTime? date = await enterDateAndTime(from);
            if (date != null) {
              if (context.mounted) {
                BlocProvider.of<AddTaskCubit>(context).from = from = date;
              }
              showFromDateTime = true;
              setState(() {});
            }
          },
          minWidth: double.infinity,
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRaduis)),
          child: Text('Enter', style: Styles.blue18Bold.copyWith(color: Colors.white)),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('End time:   ', style: Styles.blue18Bold.copyWith(color: Colors.black)),
            DateTimeContainer(datetime: showToDateTime ? to : null),
          ],
        ),
        MaterialButton(
          onPressed: () async {
            DateTime? date = await enterDateAndTime(to);
            if (date != null) {
              if (context.mounted) {
                BlocProvider.of<AddTaskCubit>(context).to = to = date;
              }
              showToDateTime = true;
              setState(() {});
            }
          },
          minWidth: double.infinity,
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRaduis)),
          child: Text('Enter', style: Styles.blue18Bold.copyWith(color: Colors.white)),
        ),
      ],
    );
  }

  Future<DateTime?> enterDateAndTime(DateTime initialdatetime) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.parse("9999-12-31 23:59:59"),
      initialDate: initialdatetime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    TimeOfDay? time;
    if (mounted) {
      time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialdatetime),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );
    }

    if (date == null && time == null) {
      if (mounted) {
        showSnakeBar(context, "Enter date and time");
      }
      return null;
    } else if (date == null) {
      if (mounted) {
        showSnakeBar(context, "Enter date");
      }
      return null;
    } else if (time == null) {
      if (mounted) {
        showSnakeBar(context, "Enter time");
      }
      return null;
    }

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
