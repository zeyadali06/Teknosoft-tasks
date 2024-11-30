enum Priority {
  high,
  medium,
  low;

  static Priority? find(String priority) {
    for (Priority element in Priority.values) {
      if (element.name == priority) {
        return element;
      }
    }
    return null;
  }

  static Priority get firstItem => high;

  static List<Priority> get all => [high, medium, low];

  static List<String> get allToString => [high.name, medium.name, low.name];
}
