
import 'package:chuck_app/src/models/joke_model.dart';
import 'package:chuck_app/src/provider/joke_provider.dart';

class Repository {

  final joke = JokeProvider();


  Future<Joke> getJoke() => joke.getJoke(); 

}