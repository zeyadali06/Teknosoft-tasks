import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

class CategoryModel {
  final String imagePath;
  final Category category;
  final int tasks;
  final List<Color> colorGradient;

  CategoryModel({required this.imagePath, required this.category, required this.tasks, required this.colorGradient});
}
