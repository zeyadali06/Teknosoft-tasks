import 'package:todo_list_app/Core/Failures/HiveFailureHandler.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Domain/RepoInterface/TaskManagementRepo.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Domain/RepoInterface/TaskValidationRepo.dart';

class TaskManagementRepoImpl extends TaskManagementRepo {
  TaskManagementRepoImpl(this.hiveServices, this.taskValidationRepo);

  final HiveServices hiveServices;
  final TaskValidationRepo taskValidationRepo;

  @override
  Future<Result<void, HiveFailureHandler>> addTask(TaskModel task) async {
    Result res = taskValidationRepo.validateTimeOnCreate(task.from, task.to);
    if (res is ResultFailure) {
      return Result.failure(HiveFailureHandler(res));
    }

    await hiveServices.addData(task);
    return const Result.success(null);
  }

  @override
  Future<Result<void, HiveFailureHandler>> updateTask(TaskModel task, Category category, Priority priority) async {
    Result res = taskValidationRepo.validateTimeOnUpdate(task);
    if (res is ResultFailure) {
      return Result.failure(HiveFailureHandler(res));
    }

    task.category = category.name;
    task.priority = priority.name;

    await task.save();
    return const Result.success(null);
  }
}
