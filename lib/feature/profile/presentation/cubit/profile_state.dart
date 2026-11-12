part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileSuccess extends ProfileState {
  final ProfileResponse? profileResponse;
  GetProfileSuccess(ProfileResponse response, {this.profileResponse});
}

final class GetProfileError extends ProfileState {
  final String error;
  GetProfileError({required this.error});
}
