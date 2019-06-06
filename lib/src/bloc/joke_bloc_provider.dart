import 'package:chuck_app/src/bloc/joke_bloc.dart';
export 'package:chuck_app/src/bloc/joke_bloc.dart';

import 'package:flutter/material.dart';


class JokeBlocProvider extends InheritedWidget {
  JokeBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = JokeBloc();

  static JokeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(JokeBlocProvider)as JokeBlocProvider).bloc;
  }

  @override
  bool updateShouldNotify( JokeBlocProvider oldWidget) {
    return true;
  }
}