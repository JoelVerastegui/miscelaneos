import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/callback_dispatcher_plugin.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/presentation/background_tasks/background_tasks_provider.dart';
import 'package:miscelaneos/presentation/providers/dbs/local_db_provider.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonsScreen extends ConsumerWidget {

  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonsAsync = ref.watch(localDbProvider);
    final backgroundTask = ref.watch(backgroundTasksProvider);

    if (pokemonsAsync.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator())
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Background Process'),
        actions: [
          IconButton(
            onPressed: () {
              Workmanager().registerOneOffTask(
                fetchBackgroundTaskKey, 
                fetchBackgroundTaskKey,
                initialDelay: const Duration(seconds: 3),
                inputData: { 'howMany': '30' },
              );
            }, 
            icon: Icon(Icons.add_alarm_sharp),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [

          _PokemonsGrid(pokemons: pokemonsAsync.value ?? [])

        ],
      ),
      floatingActionButton: backgroundTask != null
      ? FloatingActionButton.extended(
        onPressed: ref.read(backgroundTasksProvider.notifier).toggleProcess,
        label: Text('${backgroundTask ? 'Desactivar' : 'Activar'} fetch periódico'),
        icon: Icon(Icons.av_timer),
      ) : SizedBox(),
    );
  }

}

class _PokemonsGrid extends StatelessWidget {

  final List<Pokemon> pokemons;

  const _PokemonsGrid({
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ), 
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];

        return Column(
          children: [

            Image.network(
              pokemon.spriteFront,
              fit: BoxFit.contain,
            ),

            Text(pokemon.name),

          ],
        );
      },
    );
  }
}