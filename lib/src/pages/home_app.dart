import 'package:chuck_app/src/bloc/joke_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    bloc.fechJoke();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = JokeBlocProvider.of(context);
   
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildIcon(),
              _builddText(bloc),
              _buildButton(bloc)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png'),
      ),
    );
  }

  Widget _builddText(JokeBloc bloc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: StreamBuilder(
          stream: bloc.joke,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) return CircularProgressIndicator();
            return Container(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Text(snapshot.data.value,
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic)),
            );
          }),
    );
  }

  Widget _buildButton(JokeBloc bloc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: StreamBuilder(
          stream: bloc.joke,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Text('Random Joke', style: TextStyle(fontSize: 20.0)),
                ),
                onPressed: bloc.fechJoke,
              ),
            );
          }),
    );
  }
}
