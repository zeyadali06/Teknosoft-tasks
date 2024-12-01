part of 'profile_settings_view_cubit.dart';

@immutable
sealed class ProfileSettingsViewState {}

final class ProfileSettingsViewInitial extends ProfileSettingsViewState {}

final class ProfileSettingsViewLoading extends ProfileSettingsViewState {}

final class ProfileSettingsViewExitFromAccount extends ProfileSettingsViewState {}

final class ProfileSettingsViewPasswordChanged extends ProfileSettingsViewState {}

final class ProfileSettingsViewPhoneChanged extends ProfileSettingsViewState {}

final class ProfileSettingsViewFailed extends ProfileSettingsViewState {
  final String errMessage;

  ProfileSettingsViewFailed(this.errMessage);
}
