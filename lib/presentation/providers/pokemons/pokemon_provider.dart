import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/domain/repositories/pokemons_repository.dart';
import 'package:miscelaneos/infrastructure/datasources/pokemons_datasource_impl.dart';
import 'package:miscelaneos/infrastructure/repositories/pokemons_repository_impl.dart';

final pokemonsRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl(PokemonsDatasourceImpl());
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final (pokeResp, msg) = await ref.watch(pokemonsRepositoryProvider).getPokemon(id);

  if (pokeResp != null) {
    return pokeResp;
  }

  throw Exception(msg);
});