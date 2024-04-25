// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Data/Models/TaskModel.dart';
import 'package:todo_list_app/constants.dart';

Future<void> addData(TaskModel task) async {
  await Hive.box<TaskModel>(kBoxName).add(task);
}

List<TaskModel> getData() {
  return Hive.box<TaskModel>(kBoxName).values.toList();
}

void deleteData(TaskModel task) {
  task.delete();
}

void editData(TaskModel task) {
  task.save();
}
