part of 'profile_settings_view_cubit.dart';

@immutable
sealed class ProfileSettingsViewState {}

final class ProfileSettingsViewInitial extends ProfileSettingsViewState {}

final class ProfileSettingsViewLoggedout extends ProfileSettingsViewState {}

final class ProfileSettingsViewAccountDeleted extends ProfileSettingsViewState {}

final class ProfileSettingsViewPasswordChanged extends ProfileSettingsViewState {}

final class ProfileSettingsViewPhoneChanged extends ProfileSettingsViewState {}

final class ProfileSettingsViewFailed extends ProfileSettingsViewState {
  final String errMessage;

  ProfileSettingsViewFailed(this.errMessage);
}
