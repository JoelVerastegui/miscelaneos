import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/datasources/pokemons_datasource.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/infrastructure/mappers/pokemons_mapper.dart';

class PokemonsDatasourceImpl extends PokemonsDatasource {

  final Dio dio;

  PokemonsDatasourceImpl()
    : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final pokeResp = await dio.get('/pokemon/$id');

      final pokemon = PokemonsMapper.pokemonJsonToEntity(pokeResp.data);

      return (pokemon, 'Pokemon encontrado con éxito!');
    } catch(e) {
      return (null, 'No se encontró al pokemon. $e');
    }
  }

}