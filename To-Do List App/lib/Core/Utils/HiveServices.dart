import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/constants.dart';

class HiveServices {
  const HiveServices();

  Future<void> addData(TaskModel task) async {
    await Hive.box<TaskModel>(kBoxName).add(task);
  }

  List<TaskModel> getData() {
    return Hive.box<TaskModel>(kBoxName).values.toList();
  }

  Future<void> deleteData(TaskModel task) async {
    await task.delete();
    await task.save();
  }

  Future<void> editData(TaskModel task) async {
    await task.save();
  }

  Future<void> deleteAll() async {
    for (TaskModel element in getData()) {
      await element.delete();
      await element.save();
    }
  }
}
