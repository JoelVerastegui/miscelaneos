import 'package:miscelaneos/infrastructure/datasources/drift_local_db_datasource.dart';
import 'package:miscelaneos/infrastructure/datasources/pokemons_datasource_impl.dart';
import 'package:miscelaneos/infrastructure/repositories/local_db_repository_impl.dart';
import 'package:miscelaneos/infrastructure/repositories/pokemons_repository_impl.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'com.joelverastegui.miscelaneos.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey = 'com.joelverastegui.miscelaneos.fetch-periodic-background-pokemon';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
      break;

      case fetchPeriodicBackgroundTaskKey:
        await loadNextPokemon();
      break;

      case Workmanager.iOSBackgroundTask:
        print('Workmanager.iOSBackgroundTask');
      break;
    }

    return true;
  });
}

Future<void> loadNextPokemon() async {
  final localRepository = LocalDbRepositoryImpl(DriftLocalDbDatasource());
  final pokemonRepository = PokemonsRepositoryImpl(PokemonsDatasourceImpl());

  final nextPokemonId = await localRepository.pokemonCount() + 1;
  final (pokemon, message) = await pokemonRepository.getPokemon('$nextPokemonId');

  try {
    if (pokemon == null) throw message;

    await localRepository.insertPokemon(pokemon);

    print('Pokemon inserted!!: ${pokemon.name}');
  } catch(e) {
    print('$e');
  }
}