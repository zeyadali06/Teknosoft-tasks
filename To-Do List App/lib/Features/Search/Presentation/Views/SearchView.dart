// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/FloatingButton.dart';
import 'package:todo_list_app/Features/Search/Presentation/Manager/SearchViewCubit/search_view_cubit.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/widgets/SearchViewBody.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search'),
      body: const SearchViewBody(),
      floatingActionButton: FloatingButton(
        onPop: () => BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(
          BlocProvider.of<SearchViewCubit>(context).word,
          BlocProvider.of<SearchViewCubit>(context).priority,
        ),
      ),
    );
  }
}
