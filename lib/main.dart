import 'package:chuck_app/src/bloc/joke_bloc_provider.dart';
import 'package:chuck_app/src/pages/home_app.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JokeBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
      },
    ),
    );
  }
}