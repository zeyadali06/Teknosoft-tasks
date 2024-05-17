part of 'splash_view_cubit.dart';

@immutable
sealed class SplashViewState {}

final class SplashViewInitial extends SplashViewState {}

final class SplashViewSuccess extends SplashViewState {
  final bool loggedin;
  final String? email;
  final String? password;

  SplashViewSuccess(this.loggedin, this.email, this.password);
}

final class SplashViewFailed extends SplashViewState {
  final String errMessage;

  SplashViewFailed(this.errMessage);
}
