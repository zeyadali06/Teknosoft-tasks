import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.task, required this.onPop});

  final int task;
  final void Function() onPop;

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
                  onTap: () async {
                    await Navigator.of(context).pushNamed(AppRoutes.kSearchPath);
                    onPop();
                  },
                  child: Image.asset('assets/images/Screenshot 2024-04-24 213002.png', fit: BoxFit.fill, width: 30),
                ),
                const SizedBox(width: 30),
                CircleAvatar(radius: 18, backgroundColor: kPrimaryColor.withOpacity(.5)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  const CircularProgressIndicator(strokeWidth: 2.5, color: Color(0xffd1d5de), value: 1),
                  CircularProgressIndicator(
                    strokeWidth: 2.5,
                    value: BlocProvider.of<HomeViewCubit>(context).circularIndicatorValue,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 7),
            GestureDetector(
              onTap: () async {
                await Navigator.of(context).pushNamed(AppRoutes.kTodayProgressPath);
                onPop();
              },
              child: const Text("Today's Progress", style: Styles.blue12Bold),
            ),
            Text(" $task tasks left", style: Styles.grey12Bold),
          ],
        ),
      ],
    );
  }
}
