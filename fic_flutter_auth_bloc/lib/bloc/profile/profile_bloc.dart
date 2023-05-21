// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_flutter_auth_bloc/data/datasources/api_datasources.dart';
import 'package:fic4_flutter_auth_bloc/data/models/response/register_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ApiDatasource data;
  ProfileBloc(
    this.data,
  ) : super(ProfileInitial()) {
    on<DataProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await data.getDataUser();
      emit(ProfileLoaded(result));
    });
    on<LogoutProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      await data.logOut();
      emit(ProfileLogout());
    });
  }
}
