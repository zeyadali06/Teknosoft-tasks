import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/SnackBar.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/AllCategories.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskLevelContainer.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TopBar.dart';
import 'package:todo_list_app/constants.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeViewCubit>(context).getNumOfEachTask();
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        return GradientColor(
          child: Builder(
            builder: (context) {
              if (state is HomeViewFailed) {
                showSnakeBar(context, state.errMessage);
                return const Center(child: Text("Error loading tasks"));
              } else {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: Column(
                        children: [
                          TopBar(
                            task: BlocProvider.of<HomeViewCubit>(context).finishedTasks,
                            onPop: refresh,
                          ),
                          const SizedBox(height: 10),
                          Divider(color: Colors.grey.withOpacity(.15)),
                          const SizedBox(height: 10),
                          TaskLevelContainer(onPop: refresh),
                          const SizedBox(height: 25),
                          AllCategories(onPop: refresh),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
