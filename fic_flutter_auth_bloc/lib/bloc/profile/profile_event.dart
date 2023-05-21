part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class DataProfileEvent extends ProfileEvent {}

class LogoutProfileEvent extends ProfileEvent {}
