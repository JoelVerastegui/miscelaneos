import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/infrastructure/models/pokeapi_pokemon_response.dart';

class PokemonsMapper {

  static Pokemon pokemonJsonToEntity(Map<String, dynamic> json) {
    final pokeapiResp = PokeapiPokemonResponse.fromJson(json);

    return Pokemon(
      id: pokeapiResp.id,
      name: pokeapiResp.name,
      spriteFront: pokeapiResp.sprites.frontDefault,
    );
  }

}