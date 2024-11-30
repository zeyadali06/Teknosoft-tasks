import 'package:hive_flutter/hive_flutter.dart';

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
  late DateTime from;

  @HiveField(4)
  late DateTime to;

  @HiveField(5)
  late String priority;

  @HiveField(6)
  late bool important;

  @HiveField(7)
  late bool finished;

  @HiveField(8)
  DateTime? finishDate;

  @HiveField(9)
  late DateTime createdAt;

  TaskModel({
    required this.title,
    this.description = '',
    required this.category,
    required this.from,
    required this.to,
    required this.priority,
    this.important = false,
    this.finished = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "category": category,
      "from": from,
      "to": to,
      "priority": priority,
      "important": important,
      "finished": finished,
      "finishDate": finishDate,
      "createdAt": createdAt,
    };
  }
}
