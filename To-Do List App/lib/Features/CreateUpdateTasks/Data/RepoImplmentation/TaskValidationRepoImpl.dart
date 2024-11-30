import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Domain/RepoInterface/TaskValidationRepo.dart';

class TaskValidationRepoImpl extends TaskValidationRepo {
  @override
  Result<bool, CustomException> validateTimeOnCreate(DateTime? from, DateTime? to) {
    if (from == null) {
      return const Result.failure(CustomException("Enter Start Date"));
    } else if (to == null) {
      return const Result.failure(CustomException("Enter End Date"));
    } else if (from.isAfter(to)) {
      return const Result.failure(CustomException("End Date should be after Start Date"));
    } else if (from == to) {
      return const Result.failure(CustomException("Start Date shouldn't equal to End Date"));
    }
    return const Result.success(true);
  }

  @override
  Result<bool, CustomException> validateTimeOnUpdate(TaskModel task) {
    if (task.from.isAfter(task.to)) {
      return const Result.failure(CustomException("End Date should be after Start Date"));
    } else if (task.from == task.to) {
      return const Result.failure(CustomException("Start Date shouldn't equal to End Date"));
    }
    return const Result.success(true);
  }
}
