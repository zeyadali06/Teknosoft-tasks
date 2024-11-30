import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Search/Domain/RepoInterface/SearchRepo.dart';

class SearchRepoImpl extends SearchRepo {
  SearchRepoImpl(this.hiveServices);

  final HiveServices hiveServices;

  @override
  Result<List<TaskModel>, CustomException> search(String searchContent, Priority priority) {
    try {
      List<TaskModel> res = [];
      for (TaskModel task in hiveServices.getData()) {
        if (task.title.toLowerCase().contains(searchContent.toLowerCase()) && task.priority == priority.name) {
          res.add(task);
        }
      }

      return Result.success(res);
    } catch (_) {
      return const Result.failure(CustomException("Error, try again."));
    }
  }
}
