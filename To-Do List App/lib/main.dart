import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/HomeView.dart';
import 'package:todo_list_app/constants.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      home: BlocProvider(
        create: (context) => HomeViewCubit(),
        child: const HomeView(),
      ),
    );
  }
}
