import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/FetchTasksRepo.dart';

class FetchTasksRepoImpl extends FetchTasksRepo {
  FetchTasksRepoImpl(this.hiveServices);

  final HiveServices hiveServices;

  @override
  Result<List<TaskModel>, CustomException> fetchImportantTasks(DateTime dateTime) {
    try {
      List<TaskModel> res = [];

      for (TaskModel task in hiveServices.getData()) {
        if (isSameDay(dateTime, task.from) && task.important) {
          res.add(task);
        }
      }

      return Result.success(res);
    } catch (_) {
      return const Result.failure(CustomException('Failed to fetch tasks'));
    }
  }

  @override
  Result<List<TaskModel>, CustomException> fetchMyDayTasks() {
    try {
      List<TaskModel> res = [];

      for (TaskModel task in hiveServices.getData()) {
        if (isSameDay(DateTime.now(), task.from)) {
          res.add(task);
        }
      }

      return Result.success(res);
    } catch (_) {
      return const Result.failure(CustomException('Failed to fetch tasks'));
    }
  }

  @override
  Result<List<TaskModel>, CustomException> fetchSpecificCategoryTasks(DateTime dateTime, Category category) {
    try {
      List<TaskModel> res = [];

      for (TaskModel task in hiveServices.getData()) {
        if (isSameDay(dateTime, task.from) && task.category == category.name) {
          res.add(task);
        }
      }

      return Result.success(res);
    } catch (_) {
      return const Result.failure(CustomException('Failed to fetch tasks'));
    }
  }

  @override
  Result<List<TaskModel>, CustomException> fetchTodayFinishedTasks() {
    try {
      List<TaskModel> res = [];

      for (TaskModel task in hiveServices.getData()) {
        if (isSameDay(DateTime.now(), task.finishDate) && task.finished) {
          res.add(task);
        }
      }

      return Result.success(res);
    } catch (_) {
      return const Result.failure(CustomException('Failed to fetch tasks'));
    }
  }

  @override
  Result<List<TaskModel>, CustomException> fetchUpcomingTasks(DateTime dateTime) {
    try {
      List<TaskModel> allTasks = hiveServices.getData();
      List<TaskModel> res = [];

      for (TaskModel task in allTasks) {
        if (isSameDay(dateTime, task.from)) {
          res.add(task);
        }
      }

      return Result.success(res);
    } catch (_) {
      return const Result.failure(CustomException('Failed to fetch tasks'));
    }
  }
}
