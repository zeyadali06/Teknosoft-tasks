import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/FloatingButton.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/HomeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
      floatingActionButton: FloatingButton(onPop: () => BlocProvider.of<HomeViewCubit>(context).getNumOfEachTask()),
    );
  }
}
