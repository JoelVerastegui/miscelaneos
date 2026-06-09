import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/callback_dispatcher_plugin.dart';
import 'package:miscelaneos/config/plugins/shared_preferences_plugin.dart';
import 'package:workmanager/workmanager.dart';

final backgroundTasksProvider = StateNotifierProvider.autoDispose<BackgroundTasksNotifier, bool?>((ref) {
  return BackgroundTasksNotifier(fetchPeriodicBackgroundTaskKey);
});

class BackgroundTasksNotifier extends StateNotifier<bool?> {

  final String processTaskTag;

  BackgroundTasksNotifier(this.processTaskTag): super(false) { checkProcessStatus(); }

  Future<void> checkProcessStatus() async {
    state = await SharedPreferencesPlugin.getBool(processTaskTag) ?? false;
  }

  Future<void> activateProcess() async {
    await Workmanager().registerPeriodicTask(
      processTaskTag, 
      processTaskTag,
      frequency: const Duration(seconds: 10),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      tag: processTaskTag,
    );

    await SharedPreferencesPlugin.setBool(processTaskTag, true);

    state = true;
  }

  Future<void> deactivateProcess() async {
    await Workmanager().cancelByTag(processTaskTag);

    await SharedPreferencesPlugin.setBool(processTaskTag, false);

    state = false;
  }

  void toggleProcess() {
    if (state == true) {
      deactivateProcess();
    } else {
      activateProcess();
    }
  }
  
}