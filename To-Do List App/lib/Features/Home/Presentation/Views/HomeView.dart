// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/HomeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
