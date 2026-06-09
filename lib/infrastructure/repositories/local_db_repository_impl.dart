import 'package:miscelaneos/domain/datasources/local_db_datasource.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/domain/repositories/local_db_repository.dart';

class LocalDbRepositoryImpl extends LocalDbRepository {

  final LocalDbDatasource datasource;

  LocalDbRepositoryImpl(this.datasource);

  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    return datasource.insertPokemon(pokemon);
  }

  @override
  Future<List<Pokemon>> loadPokemons() {
    return datasource.loadPokemons();
  }

  @override
  Future<int> pokemonCount() {
    return datasource.pokemonCount();
  }

}