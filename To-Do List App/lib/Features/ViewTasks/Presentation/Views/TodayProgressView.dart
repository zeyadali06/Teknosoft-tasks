import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/TodayProgressViewBody.dart';

class TodayProgressView extends StatelessWidget {
  const TodayProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Today Progress'),
      body: TodayProgressViewBody(),
    );
  }
}
