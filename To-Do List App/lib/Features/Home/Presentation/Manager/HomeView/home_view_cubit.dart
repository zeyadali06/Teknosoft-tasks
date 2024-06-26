import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());
  late int myDayTasks;
  late int importantTasks;
  late int personalTasks;
  late int learningTasks;
  late int workTasks;
  late int shoppingTasks;
  late int finishedTasks;
  late int upcomingTasks;
  late double circularIndicatorValue;

  void getNumOfEachTask() {
    try {
      myDayTasks = 0;
      importantTasks = 0;
      personalTasks = 0;
      learningTasks = 0;
      workTasks = 0;
      shoppingTasks = 0;
      finishedTasks = 0;
      circularIndicatorValue = 0;
      upcomingTasks = getData().length;

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
        if (task.finished && isSameDay(task.finishDate, DateTime.now())) {
          finishedTasks++;
        }
      }

      if (getData().isEmpty) {
        circularIndicatorValue = 0;
      } else {
        circularIndicatorValue = finishedTasks / getData().length;
      }

      emit(HomeViewSuccessed());
    } catch (_) {
      emit(HomeViewFailed(errMessage: "Error, try again later!"));
    }
  }
}
