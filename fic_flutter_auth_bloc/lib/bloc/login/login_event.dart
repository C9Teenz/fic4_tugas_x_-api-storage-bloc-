// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnLoginEvent extends LoginEvent {
  final LoginModel login;
  OnLoginEvent(
    this.login,
  );
}
