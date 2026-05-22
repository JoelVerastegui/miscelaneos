import 'package:miscelaneos/domain/datasources/pokemons_datasource.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/domain/repositories/pokemons_repository.dart';

class PokemonsRepositoryImpl extends PokemonsRepository {

  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl(this.datasource);

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
  }

}