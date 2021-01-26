import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_with_emnet/models/user.dart';

class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BusyState extends UserState{}
class SuccessState extends UserState{
  final List<User> users;
  SuccessState({this.users}):assert(users!=null);

  @override
  // TODO: implement props
  List<Object> get props => [users];
}
class FailedState extends UserState{}