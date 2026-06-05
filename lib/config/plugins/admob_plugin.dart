import 'dart:async';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final adBannerId = Platform.isAndroid
  ? 'ca-app-pub-4374334417997252/9314677419'
  : 'ca-app-pub-3940256099942544/2435281174';

final adInterstitialId = Platform.isAndroid
  ? 'ca-app-pub-4374334417997252/4997667658'
  : 'ca-app-pub-3940256099942544/4411468910';

final adRewardedId = Platform.isAndroid
  ? 'ca-app-pub-4374334417997252/5316242177'
  : 'ca-app-pub-3940256099942544/1712485313';

class AdmobPlugin {

  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static Future<BannerAd> loadBannerAd() async {
    return BannerAd(
      adUnitId: adBannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // Called when an ad is successfully received.
          print("$ad loaded.");
        },
        onAdFailedToLoad: (ad, err) {
          // Called when an ad request failed.
          print("Ad failed to load with error: $err");
          ad.dispose();
        },
      ),
    )..load();
  }

  static Future<InterstitialAd> loadInterstitialAd() async {
    Completer<InterstitialAd> completer = Completer();

    InterstitialAd.load(
      adUnitId: adInterstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Called when an ad is successfully received.
          print('Ad was loaded.');

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {
              // Called when the ad showed the full screen content.
              print('Ad showed full screen content.');
            },
            onAdFailedToShowFullScreenContent: (ad, err) {
              // Called when the ad failed to show full screen content.
              print('Ad failed to show full screen content with error: $err');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) {
              // Called when the ad dismissed full screen content.
              print('Ad was dismissed.');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            onAdImpression: (ad) {
              // Called when an impression occurs on the ad.
              print('Ad recorded an impression.');
            },
            onAdClicked: (ad) {
              // Called when a click is recorded for an ad.
              print('Ad was clicked.');
            },
          );

          // Keep a reference to the ad so you can show it later.
          completer.complete(ad);
        },
        onAdFailedToLoad: (LoadAdError error) {
          // Called when an ad request failed.
          print('Ad failed to load with error: $error');
          completer.completeError(error);
        },
      ),
    );

    return completer.future;
  }

  static Future<RewardedAd> loadRewardedAd() async {
    Completer<RewardedAd> completer = Completer();

    RewardedAd.load(
      adUnitId: adRewardedId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          // Called when an ad is successfully received.
          print('Ad was loaded.');

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {
              // Called when the ad showed the full screen content.
              print('Ad showed full screen content.');
            },
            onAdFailedToShowFullScreenContent: (ad, err) {
              // Called when the ad failed to show full screen content.
              print('Ad failed to show full screen content with error: $err');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) {
              // Called when the ad dismissed full screen content.
              print('Ad was dismissed.');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            onAdImpression: (ad) {
              // Called when an impression occurs on the ad.
              print('Ad recorded an impression.');
            },
            onAdClicked: (ad) {
              // Called when a click is recorded for an ad.
              print('Ad was clicked.');
            },
          );

          // Keep a reference to the ad so you can show it later.
          completer.complete(ad);
        },
        onAdFailedToLoad: (LoadAdError error) {
          // Called when an ad request failed.
          print('Ad failed to load with error: $error');
          
          completer.completeError(error);
        },
      ),
    );

    return completer.future;
  }

}