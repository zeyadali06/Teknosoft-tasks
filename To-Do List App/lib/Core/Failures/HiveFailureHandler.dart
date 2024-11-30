import 'package:todo_list_app/Core/Failures/Result.dart';

class HiveFailureHandler extends ResultFailure {
  HiveFailureHandler(dynamic failure) : super(failure) {
    message = failure.message;
  }

  late String message;
}
