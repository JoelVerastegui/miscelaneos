import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/app_badge_plugin.dart';
import 'package:miscelaneos/presentation/providers/badge/badge_counter_provider.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final badgeCounter = ref.watch(badgeCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('App Badge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Badge(
              label: Text('$badgeCounter', style: TextStyle(fontSize: 15.0)),
              alignment: Alignment.lerp(Alignment.topRight, Alignment.bottomRight, 0.1),
              child: Text('$badgeCounter', style: TextStyle(fontSize: 150.0)),
            ),

            FilledButton.tonal(
              onPressed: () {
                ref.invalidate(badgeCounterProvider);

                AppBadgePlugin.removeBadge();
              }, 
              child: Text('Reiniciar contador')
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newValue = ref.read(badgeCounterProvider.notifier).update((state) => ++state);

          AppBadgePlugin.updateBadgeCount(newValue);
        },
        child: Icon(Icons.plus_one_outlined),
      ),
    );
  }
}