import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/plugins/admob_plugin.dart';
import 'package:miscelaneos/presentation/providers/ads/show_ads_provider.dart';

final bannerAdProvider = FutureProvider<BannerAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads deshabilitadas';

  return await AdmobPlugin.loadBannerAd();
});

final interstitialAdProvider = FutureProvider<InterstitialAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads deshabilitadas';

  return await AdmobPlugin.loadInterstitialAd();
});

final rewardedAdProvider = FutureProvider<RewardedAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads deshabilitadas';
  
  return await AdmobPlugin.loadRewardedAd();
});