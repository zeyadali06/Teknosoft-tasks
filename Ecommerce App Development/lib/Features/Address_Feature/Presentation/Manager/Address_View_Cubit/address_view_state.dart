part of 'address_view_cubit.dart';

@immutable
sealed class AddressViewState {}

final class AddressViewInitial extends AddressViewState {}

final class AddressViewLoading extends AddressViewState {}

final class AddressViewSuccessed extends AddressViewState {}

final class AddressViewFailed extends AddressViewState {
  final String errMessage;

  AddressViewFailed(this.errMessage);
}
