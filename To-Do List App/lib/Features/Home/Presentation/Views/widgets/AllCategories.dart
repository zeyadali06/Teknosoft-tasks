import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/Home/Data/Models/CategoryModel.dart';
import 'package:todo_list_app/Features/Home/Data/Models/HomeComponentsModel.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskCategories.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key, required this.onPop});

  final void Function() onPop;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = createModels(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return TasksCategory(
          category: categories[index],
          onPop: onPop,
        );
      },
    );
  }

  List<CategoryModel> createModels(BuildContext context) {
    HomeComponentsModel model = BlocProvider.of<HomeViewCubit>(context).homeComponentsModel;
    return [
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 002248.png',
        category: Category.personal,
        tasks: model.personalTasks,
        colorGradient: Category.personal.gradient,
      ),
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 011727.png',
        category: Category.learning,
        tasks: model.learningTasks,
        colorGradient: Category.learning.gradient,
      ),
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 011814.png',
        category: Category.work,
        tasks: model.workTasks,
        colorGradient: Category.work.gradient,
      ),
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 012510.png',
        category: Category.shopping,
        tasks: model.shoppingTasks,
        colorGradient: Category.shopping.gradient,
      ),
    ];
  }
}
