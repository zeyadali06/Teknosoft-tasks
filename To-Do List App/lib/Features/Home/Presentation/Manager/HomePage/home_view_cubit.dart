import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'home_view_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  int myDayTasks = 0;
  int importantTasks = 0;
  int personalTasks = 0;
  int learningTasks = 0;
  int workTasks = 0;
  int shoppingTasks = 0;

  void getNumOfEachTask() {
    try {
      emit(HomePageLoading());
      List<TaskModel> tasks = getData();
      for (TaskModel task in tasks) {
        if (task.category == Category.Personal.name) {
          personalTasks++;
        }
        if (task.category == Category.Learning.name) {
          learningTasks++;
        }
        if (task.category == Category.Work.name) {
          workTasks++;
        }
        if (task.category == Category.Shopping.name) {
          shoppingTasks++;
        }
        if (isSameDay(DateTime.now(), task.from)) {
          myDayTasks++;
        }
        if (task.important) {
          importantTasks++;
        }
      }
      emit(HomePageSuccessed());
    } catch (_) {
      emit(HomePageFailed(errMessage: "Error"));
    }
  }
}
