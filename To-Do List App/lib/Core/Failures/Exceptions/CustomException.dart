import 'package:todo_list_app/Core/Failures/Result.dart';

class CustomException extends ResultFailure {
  const CustomException(this.message) : super(null);

  final String message;
}
