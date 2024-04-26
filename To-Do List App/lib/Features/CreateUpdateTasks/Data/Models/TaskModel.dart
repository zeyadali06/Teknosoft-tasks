// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';
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
  Personal(gradient: [Color(0xff7d9bdf), Color(0xff5070c5)]),
  Learning(gradient: [Color(0xffbc7096), Color(0xff7474c4)]),
  Work(gradient: [Color(0xff669bab), Color(0xff6182ca)]),
  Shopping(gradient: [Color(0xffff9187), Color(0xffe36163)]);

  const Category({required this.gradient});

  final List<Color> gradient;

  static String get firstItem => Personal.name;

  static List<String> get all => [Personal.name, Learning.name, Work.name, Shopping.name];
}

enum Priority {
  High,
  Medium,
  Low;

  static String get firstItem => High.name;

  static List<String> get all => [High.name, Medium.name, Low.name];
}
