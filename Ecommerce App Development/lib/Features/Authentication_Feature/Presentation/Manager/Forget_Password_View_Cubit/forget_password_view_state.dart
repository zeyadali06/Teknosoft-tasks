part of 'forget_password_view_cubit.dart';

@immutable
sealed class ForgetPasswordViewState {}

final class ForgetPasswordViewInitial extends ForgetPasswordViewState {}

final class ForgetPasswordViewLoading extends ForgetPasswordViewState {}

final class ForgetPasswordViewSuccessed extends ForgetPasswordViewState {}

final class ForgetPasswordViewFailed extends ForgetPasswordViewState {
  final String errMessage;

  ForgetPasswordViewFailed(this.errMessage);

}
