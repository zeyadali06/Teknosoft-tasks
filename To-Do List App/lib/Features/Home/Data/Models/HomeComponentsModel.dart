class HomeComponentsModel {
  HomeComponentsModel({
    required this.myDayTasks,
    required this.importantTasks,
    required this.personalTasks,
    required this.learningTasks,
    required this.workTasks,
    required this.shoppingTasks,
    required this.finishedTasks,
    required this.upcomingTasks,
    required this.circularIndicatorValue,
  });

  factory HomeComponentsModel.init() {
    return HomeComponentsModel(
      myDayTasks: 0,
      importantTasks: 0,
      personalTasks: 0,
      learningTasks: 0,
      workTasks: 0,
      shoppingTasks: 0,
      finishedTasks: 0,
      upcomingTasks: 0,
      circularIndicatorValue: 0,
    );
  }

  int myDayTasks;
  int importantTasks;
  int personalTasks;
  int learningTasks;
  int workTasks;
  int shoppingTasks;
  int finishedTasks;
  int upcomingTasks;
  double circularIndicatorValue;
}
