import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

abstract class TaskValidationRepo {
  Result<bool, CustomException> validateTimeOnCreate(DateTime? from, DateTime? to);
  Result<bool, CustomException> validateTimeOnUpdate(TaskModel task);
}
