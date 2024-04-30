// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/CustomPopScope.dart';
import 'package:todo_list_app/Core/Common/CustomTaskContainer.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/NoThingToShow.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Search/Presentation/Manager/SearchViewCubit/search_view_cubit.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/widgets/SearchTextField.dart';
import 'package:todo_list_app/constants.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});

  List<TaskModel> res = getData();

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      toScreenPath: AppRouter.kHomePath,
      child: GradientColor(
        child: Column(
          children: [
            const SearchTextField(),
            Expanded(
              child: BlocBuilder<SearchViewCubit, SearchViewState>(
                builder: (context, state) {
                  res = BlocProvider.of<SearchViewCubit>(context).tasks;
                  if (state is SearchViewFind) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(kPadding),
                      itemCount: res.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomTaskContainer(task: res[index]);
                      },
                    );
                  } else if (state is SearchViewInitial) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(kPadding),
                      itemCount: getData().length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomTaskContainer(task: getData()[index]);
                      },
                    );
                  } else {
                    return const Center(child: LottieImage());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
