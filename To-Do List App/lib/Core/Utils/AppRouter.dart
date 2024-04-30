// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/CreateTaskCubit/create_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/UpdateTaskCubit/update_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/CreateNewTaskView.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/UpdateTaskView.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/HomeView.dart';
import 'package:todo_list_app/Features/Search/Presentation/Manager/SearchViewCubit/search_view_cubit.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/SearchView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/ImportantTasks/important_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/MyDayTasks/my_day_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/TasksOfCategorey/tasks_of_categorey_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/TodayProgress/today_progress_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/UpcomingTasks/upcoming_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/ImportantTasksView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/MyDayTasksView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/TasksOfCategoryView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/TodayProgressView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/UpcomingTasksView.dart';

abstract class AppRoutes {
  static const String kHomePath = "/HomeView";
  static const String kSearchPath = "/SearchView";
  static const String kCreateTaskPath = "/CreateNewTaskView";
  static const String kUpdateTaskPath = "/UpdateTaskView";
  static const String kMyDayTasksPath = "/MyDayTasksView";
  static const String kImportantTasksPath = "/ImportantTasksView";
  static const String kUpcomingTasksPath = "/UpcomingTasksView";
  static const String kTasksOfCategoryPath = "/TasksOfCategoryView";
  static const String kTodayProgressPath = "/TodayProgressView";

  static Map<String, Widget Function(BuildContext)> routes = {
    kHomePath: (context) {
      return BlocProvider(
        create: (context) => HomeViewCubit(),
        child: const HomeView(),
      );
    },
    kSearchPath: (context) {
      return BlocProvider(
        create: (context) => SearchViewCubit(),
        child: const SearchView(),
      );
    },
    kCreateTaskPath: (context) {
      return BlocProvider(
        create: (context) => AddTaskCubit(),
        child: const CreateNewTaskView(),
      );
    },
    kUpdateTaskPath: (context) {
      return BlocProvider(
        create: (context) => UpdateTaskCubit(),
        child: UpdateTaskView(task: ModalRoute.of(context)!.settings.arguments as TaskModel),
      );
    },
    kMyDayTasksPath: (context) {
      return BlocProvider(
        create: (context) => MyDayTasksCubit(),
        child: const MyDayTasksView(),
      );
    },
    kImportantTasksPath: (context) {
      return BlocProvider(
        create: (context) => ImportantTasksCubit(),
        child: const ImportantTasksView(),
      );
    },
    kUpcomingTasksPath: (context) {
      return BlocProvider(
        create: (context) => UpcomingTasksCubit(),
        child: const UpcomingTasksView(),
      );
    },
    kTasksOfCategoryPath: (context) {
      return BlocProvider(
        create: (context) => TasksOfCategoreyCubit(),
        child: TasksOfCategoryView(category: ModalRoute.of(context)!.settings.arguments as Category),
      );
    },
    kTodayProgressPath: (context) {
      return BlocProvider(
        create: (context) => TodayProgressCubit(),
        child: const TodayProgressView(),
      );
    },
  };
}
