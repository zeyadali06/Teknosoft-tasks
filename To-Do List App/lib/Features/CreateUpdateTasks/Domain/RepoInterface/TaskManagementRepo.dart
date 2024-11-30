import 'package:todo_list_app/Core/Failures/HiveFailureHandler.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

abstract class TaskManagementRepo {
  Future<Result<void, HiveFailureHandler>> addTask(TaskModel task);
  Future<Result<void, HiveFailureHandler>> updateTask(TaskModel task, Category category, Priority priority);
}
