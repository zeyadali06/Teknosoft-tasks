// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/CreateTaskCubit/create_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/CreateNewTaskView.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/UpdateTaskView.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/HomeView.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/SearchView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/MyDayTasks/my_day_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/MyDayTasksView.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/ShowTasksView.dart';

abstract class AppRouter {
  static const String kHomePath = "/HomeView";
  static const String kSearchPath = "/SearchView";
  static const String kCreateTaskPath = "/CreateNewTaskView";
  static const String kUpdateTaskPath = "/UpdateTaskView";
  static const String kMyDayTasksPath = "/MyDayTasksView";
  static const String kImportantTasksPath = "/ImportantTasksView";
  static const String kUpcomingTasksPath = "/UpcomingTasksView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kHomePath,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kSearchPath,
        builder: (context, state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: kCreateTaskPath,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AddTaskCubit(),
            child: const CreateNewTaskView(),
          );
        },
      ),
      GoRoute(
        path: kUpdateTaskPath,
        builder: (context, state) {
          return const UpdateTaskView();
        },
      ),
      GoRoute(
        path: kMyDayTasksPath,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MyDayTasksCubit(),
            child: const MyDayTasksView(),
          );
        },
      ),
      GoRoute(
        path: kImportantTasksPath,
        builder: (context, state) {
          return const ShowTasksView();
        },
      ),
      GoRoute(
        path: kUpcomingTasksPath,
        builder: (context, state) {
          return const ShowTasksView();
        },
      ),
    ],
  );
}
