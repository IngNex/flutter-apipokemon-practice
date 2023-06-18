import 'dart:convert';

import 'package:flutter_ui_apipokemon/domain/model/pokemon_modal.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<Pokemon>> getPokemon(url) async {
    final api = Uri.parse(url);
    var response = await http.get(api);
    var responseData = json.decode(response.body);
    List<Pokemon> pokemonData = [];
    for (var index in responseData['pokemon']) {
      Pokemon jsonPokemon = Pokemon(
        id: index['id'],
        num: index['num'],
        name: index['name'],
        img: index['img'],
        type: index['type'],
        height: index['height'],
        weight: index['weight'],
        egg: index['egg'],
        weaknesses: index['weaknesses'],
        prev_evolution:
            index['prev_evolution'] == null ? [] : index['prev_evolution'],
        next_evolution:
            index['next_evolution'] == null ? [] : index['next_evolution'],
      );
      pokemonData.add(jsonPokemon);
    }
    return pokemonData;
  }
}
