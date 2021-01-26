import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_emnet/bloc/user_bloc.dart';
import 'package:flutter_bloc_with_emnet/bloc/user_event.dart';
import 'package:flutter_bloc_with_emnet/bloc/user_state.dart';
import 'package:flutter_bloc_with_emnet/repositories/user_repository.dart';

void main() {
  UserRepository _userRepository = UserRepository();
  runApp(BlocProvider(
      create: (BuildContext context) => UserBloc(userRepository: _userRepository)..add(GetUsersEvent()),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black45,
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is BusyState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessState) {
                return ListView.builder(
                  itemCount: state.users.length,
                    itemBuilder: (context, index) => Text('${state.users[index].name}',style: TextStyle(color: Colors.white),));
              } else if (state is FailedState) {
                return Text('failed');
              }
              return Container();
            },
          )),
    );
  }
}
