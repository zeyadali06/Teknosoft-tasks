import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

abstract class FetchTasksRepo {
  Result<List<TaskModel>, CustomException> fetchMyDayTasks();
  Result<List<TaskModel>, CustomException> fetchSpecificCategoryTasks(DateTime dateTime, Category category);
  Result<List<TaskModel>, CustomException> fetchTodayFinishedTasks();
  Result<List<TaskModel>, CustomException> fetchUpcomingTasks(DateTime dateTime);
  Result<List<TaskModel>, CustomException> fetchImportantTasks(DateTime dateTime);
}
