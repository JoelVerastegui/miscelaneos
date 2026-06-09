import 'package:miscelaneos/config/database/drift_database.dart' hide Pokemon;
import 'package:miscelaneos/domain/datasources/local_db_datasource.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';

class DriftLocalDbDatasource extends LocalDbDatasource {

  late AppDatabase database;

  DriftLocalDbDatasource(): database = AppDatabase();

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    await database.into(database.pokemons).insert(
      PokemonsCompanion.insert(
        id: pokemon.id,
        name: pokemon.name,
        spriteFront: pokemon.spriteFront,
      ),
    );
  }

  @override
  Future<List<Pokemon>> loadPokemons() async {
    final query = database.select(database.pokemons);

    final allItems = await query.get();

    return allItems.map((row) => Pokemon(
      id: row.id,
      name: row.name,
      spriteFront: row.spriteFront,
    )).toList();
  }

  @override
  Future<int> pokemonCount() async {
    final query = database.select(database.pokemons);

    final pokemons = await query.get();

    return pokemons.length;
  }

}