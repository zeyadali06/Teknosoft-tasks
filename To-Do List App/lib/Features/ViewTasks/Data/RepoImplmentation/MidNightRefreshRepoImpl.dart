import 'dart:async';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/MidNightRefreshRepo.dart';

class MidHightRefresherRepoImpl extends MidHightRefresherRepo {
  @override
  void refresh(void Function() timerCallBack) {
    final DateTime now = DateTime.now();
    final DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final Duration duration = nextMidnight.difference(now);
    Timer(duration, timerCallBack);
  }
}
