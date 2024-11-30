import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

abstract class SearchRepo {
  Result<List<TaskModel>, CustomException> search(String searchContent, Priority priority);
}
