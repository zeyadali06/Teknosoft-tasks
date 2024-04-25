// ignore_for_file: file_names

import 'package:hive/hive.dart';

part 'TaskModel.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late String category;

  @HiveField(3)
  late DateTime datetime;

  @HiveField(4)
  late String priority;

  @HiveField(5)
  late bool important;

  TaskModel({
    required this.title,
    this.description = '',
    required this.category,
    required this.datetime,
    required this.priority,
    this.important = false,
  });
}

enum Category {
  personal(category: "Personal"),
  learning(category: "Learning"),
  work(category: "Work"),
  shopping(category: "Shopping");

  const Category({required this.category});

  final String category;

  static List<String> get all => ["Personal", "Learning", "Work", "Shopping"];
}

enum Priority {
  high(priority: "High"),
  medium(priority: "Medium"),
  low(priority: "Low");

  const Priority({required this.priority});

  final String priority;

  static List<String> get all => ["High", "Medium", "Low"];
}
