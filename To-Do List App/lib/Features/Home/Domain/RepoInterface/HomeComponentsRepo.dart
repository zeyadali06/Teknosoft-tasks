import 'package:todo_list_app/Core/Failures/Exceptions/CustomException.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/Home/Data/Models/HomeComponentsModel.dart';

abstract class HomeComponentsRepo {
  Result<HomeComponentsModel, CustomException> getHomeComponents();
}
