import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemon_list_provider.dart';

class PokemonsScreen extends StatelessWidget {

  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PokemonsView(),
    );
  }

}

class _PokemonsView extends ConsumerStatefulWidget {

  @override
  ConsumerState<_PokemonsView> createState() => __PokemonsViewState();

}

class __PokemonsViewState extends ConsumerState<_PokemonsView> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(infiniteScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withAlpha(204),
        ),

        _PokemonsGrid(),
      ]
    );
  }

  void infiniteScroll() {
    final pokeIds = ref.read(pokemonsIdsProvider);

    if (pokeIds.length > 400) {
      scrollController.removeListener(infiniteScroll);
      return;
    }

    if (scrollController.position.pixels + 200 > scrollController.position.maxScrollExtent) {
      ref.read(pokemonsIdsProvider.notifier).update((state) => [
        ...state,
        ...List.generate(30, (index) => state.length + index + 1),
      ]);
    }
  }

}

class _PokemonsGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final pokemonIds = ref.watch(pokemonsIdsProvider);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ), 
      itemCount: pokemonIds.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.push('/pokemons/${pokemonIds[index]}'),
        child: Image.network(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemonIds[index]}.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}