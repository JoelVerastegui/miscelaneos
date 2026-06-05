import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/presentation/providers/ads/admob_providers.dart';
import 'package:miscelaneos/presentation/widgets/shared/main_menu.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bannerAdAsync = ref.watch(bannerAdProvider);

    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text('Miscelaneos'),
                    actions: [
                      IconButton(
                        onPressed: () => context.push('/permissions'),
                        icon: Icon(Icons.settings)
                      )
                    ],
                  ),
                  const MainMenu(),
                ],
              ),
            ),
          ),

          bannerAdAsync.when(
            data: (bannerAd) => SizedBox(
              width: bannerAd.size.width.toDouble(),
              height: bannerAd.size.height.toDouble(),
              child: AdWidget(ad: bannerAd),
            ), 
            error: (error, stackTrace) => SizedBox(), 
            loading: () => SizedBox(), 
          ),

        ]
      ),
    );
  }
}