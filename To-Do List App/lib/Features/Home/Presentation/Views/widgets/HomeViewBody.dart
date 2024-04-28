// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomePage/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/AllCategories.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskLevelContainer.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TopBar.dart';
import 'package:todo_list_app/constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  final int task = 5;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomePageCubit>(context).getNumOfEachTask();
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: GradientColor(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  children: [
                    TopBar(task: task),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey.withOpacity(.15)),
                    const SizedBox(height: 10),
                    const TaskLevelContainer(),
                    const SizedBox(height: 25),
                    const AllCategories(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
