import 'package:http/http.dart' as http;
import '../models/pokemon_list_model.dart';

class PokemonListService {
  Future<PokemonListModel> fetchAllPokemon() async {
    //future is equivalent to promises in JavaScript

    final Uri url = Uri(
      scheme: 'https',
      host: 'pokeapi.co',
      path: '/api/v2/pokemon',
      queryParameters: {'limit': "2000", 'offset': "0"},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200 /*ok*/) {
      // print(PokemonModel.fromJson(response.body));
      try {
        return PokemonListModel.fromJson(response.body);
      } catch (_, st) {
        print(_.toString());
        print(st);
        rethrow;
      }
    } else {
      throw Exception("failed to load weather information");
    }
  }
}
