import 'package:rxdart/rxdart.dart';

import 'package:chuck_app/src/models/joke_model.dart';
import 'package:chuck_app/src/resources/repository.dart';

class JokeBloc {
  final _repo = Repository();

  final _joke = PublishSubject<Joke>();

  Observable<Joke> get joke => _joke.stream;

  fechJoke() async {
    Joke joke = await _repo.getJoke();

    _joke.sink.add(joke);
  }

  dispose() {
    _joke.close();
  }
}

final bloc = JokeBloc();
