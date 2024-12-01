part of 'sign_up_view_cubit.dart';

@immutable
sealed class SignUpViewState {}

final class SignUpViewInitial extends SignUpViewState {}

final class SignUpViewLoading extends SignUpViewState {}

final class SignUpViewSuccessed extends SignUpViewState {}

final class SignUpViewFailed extends SignUpViewState {
  final String errMessage;

  SignUpViewFailed(this.errMessage);
}
