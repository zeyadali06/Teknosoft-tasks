import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'search_view_state.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  SearchViewCubit() : super(SearchViewInitial());

  List<TaskModel> tasks = getData();

  List<TaskModel> getRelatedTasks(String str) {
    List<TaskModel> res = [];
    for (TaskModel task in getData()) {
      if (task.title.contains(str)) {
        res.add(task);
      }
    }

    if (res.isNotEmpty) {
      emit(SearchViewFind());
    } else {
      emit(SearchViewNotFound());
    }

    tasks = res;
    return res;
  }
}
