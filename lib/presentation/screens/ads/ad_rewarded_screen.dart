import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/ads/admob_points_provider.dart';
import 'package:miscelaneos/presentation/providers/ads/admob_providers.dart';

class AdRewardedScreen extends ConsumerWidget {

  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final rewardedAdAsync = ref.watch(rewardedAdProvider);
    final adPoints = ref.watch(admobPointsProvider);

    ref.listen(rewardedAdProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;
      next.value!.show(onUserEarnedReward: (ad, reward) {
        ref.read(admobPointsProvider.notifier).update((state) => state + reward.amount.toInt());
      });
    });

    if (rewardedAdAsync.isLoading) {
      return Scaffold(
        body: Center(child: Text('Cargando rewarded ad')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ad Rewarded Screen')
      ),
      body: Center(
        child: Text('Puntos acumulados: $adPoints'),
      ),
    );
  }
  
}