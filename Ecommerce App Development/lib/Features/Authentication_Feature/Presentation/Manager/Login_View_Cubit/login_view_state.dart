part of 'login_view_cubit.dart';

@immutable
sealed class LoginViewState {}

final class LoginViewInitial extends LoginViewState {}

final class LoginViewLoading extends LoginViewState {}

final class LoginViewSuccessed extends LoginViewState {}

final class LoginViewFailed extends LoginViewState {
  final String errMessage;

  LoginViewFailed(this.errMessage);
}
