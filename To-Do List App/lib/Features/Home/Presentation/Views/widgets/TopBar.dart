// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.task});

  final int task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('lists', style: Styles.black32Bold),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSearchPath);
                  },
                  child: Image.asset('assets/images/Screenshot 2024-04-24 213002.png', fit: BoxFit.fill, width: 30),
                ),
                const SizedBox(width: 30),
                const CircleAvatar(radius: 18, backgroundColor: Colors.black),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // const CircleAvatar(backgroundColor: Colors.black, radius: 10),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  const CircularProgressIndicator(strokeWidth: 2.5, color: Color(0xffd1d5de), value: 1),
                  CircularProgressIndicator(
                    strokeWidth: 2.5,
                    value: (BlocProvider.of<HomeViewCubit>(context).finishedTasks) / (BlocProvider.of<HomeViewCubit>(context).myDayTasks),
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 7),
            const Text("Today's Progress", style: Styles.blue12Bold),
            Text(" $task tasks left", style: Styles.grey12Bold),
          ],
        ),
      ],
    );
  }
}
