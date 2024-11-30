import 'dart:ui';

enum Category {
  personal(gradient: [Color(0xff7d9bdf), Color(0xff5070c5)]),
  learning(gradient: [Color(0xffbc7096), Color(0xff7474c4)]),
  work(gradient: [Color(0xff669bab), Color(0xff6182ca)]),
  shopping(gradient: [Color(0xffff9187), Color(0xffe36163)]);

  const Category({required this.gradient});

  final List<Color> gradient;

  static Category? find(String category) {
    for (Category element in Category.values) {
      if (element.name == category) {
        return element;
      }
    }
    return null;
  }

  static Category get firstItem => personal;

  static List<Category> get all => [personal, learning, work, shopping];

  static List<String> get allToString => [personal.name, learning.name, work.name, shopping.name];
}
