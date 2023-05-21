// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLogout extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final RegisterResponseModel user;
  ProfileLoaded(
    this.user,
  );
}
