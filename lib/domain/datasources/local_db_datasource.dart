import 'package:miscelaneos/domain/entities/pokemon.dart';

abstract class LocalDbDatasource {
  Future<List<Pokemon>> loadPokemons();

  Future<int> pokemonCount();

  Future<void> insertPokemon(Pokemon pokemon);
}