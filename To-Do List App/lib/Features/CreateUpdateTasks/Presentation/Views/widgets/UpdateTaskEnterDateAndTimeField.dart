// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/UpdateTaskCubit/update_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/DateTimeContainer.dart';
import 'package:todo_list_app/constants.dart';

class UpdateTaskEnterDateAndTimeField extends StatefulWidget {
  const UpdateTaskEnterDateAndTimeField({super.key});

  @override
  State<UpdateTaskEnterDateAndTimeField> createState() => _UpdateTaskEnterDateAndTimeFieldState();
}

class _UpdateTaskEnterDateAndTimeFieldState extends State<UpdateTaskEnterDateAndTimeField> {
  DateTime? date;
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Start time:   ', style: Styles.blue18Bold.copyWith(color: Colors.black)),
            DateTimeContainer(datetime: BlocProvider.of<UpdateTaskCubit>(context).task.from),
          ],
        ),
        MaterialButton(
          onPressed: () async {
            await enterDateAndTime(BlocProvider.of<UpdateTaskCubit>(context).task.from);
            if (date != null && time != null) {
              DateTime newDate = DateTime(date!.year, date!.month, date!.day, time!.hour, time!.minute);
              BlocProvider.of<UpdateTaskCubit>(context).task.from = newDate;
            } else if (date == null && time != null) {
              DateTime oldDate = BlocProvider.of<UpdateTaskCubit>(context).task.from;
              DateTime newDate = DateTime(oldDate.year, oldDate.month, oldDate.day, time!.hour, time!.minute);
              BlocProvider.of<UpdateTaskCubit>(context).task.from = newDate;
            } else if (date != null && time == null) {
              DateTime oldDate = BlocProvider.of<UpdateTaskCubit>(context).task.from;
              DateTime newDate = DateTime(date!.year, date!.month, date!.day, oldDate.hour, oldDate.minute);
              BlocProvider.of<UpdateTaskCubit>(context).task.from = newDate;
            }
            setState(() {});
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
            DateTimeContainer(datetime: BlocProvider.of<UpdateTaskCubit>(context).task.to),
          ],
        ),
        MaterialButton(
          onPressed: () async {
            await enterDateAndTime(BlocProvider.of<UpdateTaskCubit>(context).task.to);
            if (date != null && time != null) {
              DateTime newDate = DateTime(date!.year, date!.month, date!.day, time!.hour, time!.minute);
              BlocProvider.of<UpdateTaskCubit>(context).task.to = newDate;
            } else if (date == null && time != null) {
              DateTime oldDate = BlocProvider.of<UpdateTaskCubit>(context).task.to;
              DateTime newDate = DateTime(oldDate.year, oldDate.month, oldDate.day, time!.hour, time!.minute);
              BlocProvider.of<UpdateTaskCubit>(context).task.to = newDate;
            } else if (date != null && time == null) {
              DateTime oldDate = BlocProvider.of<UpdateTaskCubit>(context).task.to;
              DateTime newDate = DateTime(date!.year, date!.month, date!.day, oldDate.hour, oldDate.minute);
              BlocProvider.of<UpdateTaskCubit>(context).task.to = newDate;
            }
            setState(() {});
          },
          minWidth: double.infinity,
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRaduis)),
          child: Text('Enter', style: Styles.blue18Bold.copyWith(color: Colors.white)),
        ),
      ],
    );
  }

  Future<void> enterDateAndTime(DateTime initialdatetime) async {
    date = await showDatePicker(
      context: context,
      firstDate: BlocProvider.of<UpdateTaskCubit>(context).task.createdAt,
      lastDate: DateTime.parse("9999-12-31 23:59:59"),
      initialDate: initialdatetime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

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
}
