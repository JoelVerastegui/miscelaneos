import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/share_plugin.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {

  final String id;

  const PokemonScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonProvider(id));

    return pokemonAsync.when(
      data: (data) => _PokemonView(pokemon: data), 
      error: (error, stackTrace) => _ErrorWidget(errorMessage: '$error'), 
      loading: () => _LoadingWidget(),
    );
  }
}

class _PokemonView extends StatelessWidget {

  final Pokemon pokemon;

  const _PokemonView({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () => SharePlugin.shareLink(
              'https://poke-pika-deeplink.up.railway.app/pokemons/${pokemon.id}/', 
              'Mira este pokemón!'
            ), 
            icon: Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          width: 150.0,
          height: 150.0,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String errorMessage;

  const _ErrorWidget({
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Text(errorMessage),
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }

}