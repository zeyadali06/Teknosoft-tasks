import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Search/Domain/RepoInterface/SearchRepo.dart';

part 'search_view_state.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  SearchViewCubit(this.repo, this.hiveServices) : super(SearchViewInitial()) {
    tasks = hiveServices.getData();
  }

  String word = '';
  Priority priority = Priority.firstItem;
  final SearchRepo repo;
  final HiveServices hiveServices;
  late List<TaskModel> tasks;

  List<TaskModel> getRelatedTasks(String searchContent, Priority priority) {
    Result res = repo.search(searchContent, priority);

    if (res is ResultSuccess) {
      if (res.data.isNotEmpty) {
        emit(SearchViewFind(res.data));
      } else {
        emit(SearchViewNotFound());
      }
      tasks = res.data;
    }
    return tasks;
  }
}
