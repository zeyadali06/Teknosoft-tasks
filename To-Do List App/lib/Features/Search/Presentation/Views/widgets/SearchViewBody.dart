import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/CustomTaskContainer.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/NoThingToShow.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Search/Presentation/Manager/SearchViewCubit/search_view_cubit.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/widgets/PriorityLevels.dart';
import 'package:todo_list_app/Features/Search/Presentation/Views/widgets/SearchTextField.dart';
import 'package:todo_list_app/constants.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late List<TaskModel> res;
  late String searchText;
  late Priority pri;

  @override
  void initState() {
    pri = BlocProvider.of<SearchViewCubit>(context).priority;
    searchText = '';
    res = BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(searchText, pri);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GradientColor(
      child: Column(
        children: [
          SearchTextField(
            onChanged: (value) {
              searchText = value;
              BlocProvider.of<SearchViewCubit>(context).word = value;
            },
          ),
          PriorityLevels(
            pri: pri,
            onPriorityChanged: (Priority p) {
              pri = p;
              BlocProvider.of<SearchViewCubit>(context).priority = p;
              BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(searchText, pri);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Divider(height: 0, color: kPrimaryColor.withOpacity(.5), thickness: 1),
          ),
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
                      return CustomTaskContainer(
                        onPop: () => BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(searchText, pri),
                        task: res[index],
                        onDismissed: (direction) => onDismissed(direction, index),
                      );
                    },
                  );
                } else if (state is SearchViewInitial) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(kPadding),
                    itemCount: getData().length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomTaskContainer(
                        onPop: () => BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(searchText, pri),
                        task: getData()[index],
                        onDismissed: (direction) => onDismissed(direction, index),
                      );
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
    );
  }

  Future<void> onDismissed(DismissDirection direction, int index) async {
    await res[index].delete();
    if (mounted) {
      BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(searchText, pri);
    }
  }
}
