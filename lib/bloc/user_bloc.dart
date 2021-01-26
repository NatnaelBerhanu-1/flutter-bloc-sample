import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_emnet/bloc/user_event.dart';
import 'package:flutter_bloc_with_emnet/bloc/user_state.dart';
import 'package:flutter_bloc_with_emnet/models/user.dart';
import 'package:flutter_bloc_with_emnet/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({this.userRepository}) : super(BusyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print('getting data');
    yield BusyState();
    try {
      if (event is GetUsersEvent) {
        var users = await userRepository.getUsers();
        yield SuccessState(users: users);
      }
    } catch (error) {
      yield FailedState();
    }
  }
}
