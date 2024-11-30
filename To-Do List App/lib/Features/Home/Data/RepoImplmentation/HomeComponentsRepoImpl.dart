import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Home/Data/Models/HomeComponentsModel.dart';
import 'package:todo_list_app/Features/Home/Domain/RepoInterface/HomeComponentsRepo.dart';

class HomeComponentsRepoImpl extends HomeComponentsRepo {
  HomeComponentsRepoImpl(this.hiveServices);

  final HiveServices hiveServices;

  @override
  Result<HomeComponentsModel, CustomException> getHomeComponents() {
    try {
      final HomeComponentsModel homeComponentsModel = HomeComponentsModel.init();

      List<TaskModel> tasks = hiveServices.getData();
      for (TaskModel task in tasks) {
        if (task.category == Category.personal.name) {
          homeComponentsModel.personalTasks++;
        } else if (task.category == Category.learning.name) {
          homeComponentsModel.learningTasks++;
        } else if (task.category == Category.work.name) {
          homeComponentsModel.workTasks++;
        } else if (task.category == Category.shopping.name) {
          homeComponentsModel.shoppingTasks++;
        }

        if (isSameDay(DateTime.now(), task.from)) {
          homeComponentsModel.myDayTasks++;
        }

        if (task.important) {
          homeComponentsModel.importantTasks++;
        }

        if (task.finished && isSameDay(task.finishDate, DateTime.now())) {
          homeComponentsModel.finishedTasks++;
        }
      }

      if (hiveServices.getData().isEmpty) {
        homeComponentsModel.circularIndicatorValue = 0;
      } else {
        homeComponentsModel.circularIndicatorValue = homeComponentsModel.finishedTasks / hiveServices.getData().length;
      }

      homeComponentsModel.upcomingTasks = tasks.length;

      return Result.success(homeComponentsModel);
    } catch (_) {
      return const Result.failure(CustomException("Error, try again."));
    }
  }
}
