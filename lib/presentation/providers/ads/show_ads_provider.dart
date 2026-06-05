import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/shared_preferences_plugin.dart';

const showAdsFlag = 'showAds';

final showAdsProvider = StateNotifierProvider.autoDispose<ShowAdsNotifier, bool>((ref) {
  return ShowAdsNotifier();
});

class ShowAdsNotifier extends StateNotifier<bool> {

  ShowAdsNotifier(): super(false) {
    checkAdsStatus();
  }

  Future<void> checkAdsStatus() async {
    final value = await SharedPreferencesPlugin.getBool(showAdsFlag) ?? true;
    state = value;
  }

  Future<void> removeAds() async {
    await SharedPreferencesPlugin.setBool(showAdsFlag, false);
    state = false;
  }

  Future<void> showAds() async {
    await SharedPreferencesPlugin.setBool(showAdsFlag, true);
    state = true;
  }

  Future<void> toggleAds() async {
    state ? removeAds() : showAds();
  }
  
}