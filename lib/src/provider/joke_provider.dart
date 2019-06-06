import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:chuck_app/src/models/joke_model.dart';

class JokeProvider {
  String _url = 'api.chucknorris.io';

  Future<Joke> _processData(Uri url) async {
    final resp = await http.get(url);
    final dataDecoded = json.decode(resp.body);

    final joke = Joke.fromJson(dataDecoded);

    return joke;
  }

  Future<Joke> getJoke() async {
    final url = Uri.https(_url, '/jokes/random');
    final resp = await _processData(url);

    return resp;
  }
}
