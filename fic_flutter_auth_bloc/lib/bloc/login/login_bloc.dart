// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_flutter_auth_bloc/data/datasources/api_datasources.dart';
import 'package:fic4_flutter_auth_bloc/data/models/request/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiDatasource data;
  LoginBloc(
    this.data,
  ) : super(LoginInitial()) {
    on<OnLoginEvent>((event, emit) async {
      emit(LoginLoading());
      await data.login(event.login);
      emit(LoginSuccess());
    });
  }
}
