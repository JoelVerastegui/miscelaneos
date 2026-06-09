import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/infrastructure/datasources/drift_local_db_datasource.dart';
import 'package:miscelaneos/infrastructure/repositories/local_db_repository_impl.dart';

final localDbProvider = FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  final localRepository = LocalDbRepositoryImpl(DriftLocalDbDatasource());

  return await localRepository.loadPokemons();
});