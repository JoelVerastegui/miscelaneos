import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/plugins/local_auth_plugin.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();  
});

final localAuthProvider = StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) {
  return LocalAuthNotifier();
});

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier(): super(LocalAuthState());
  
  Future<(bool, String)> authenticateUser() async {
    state = state.copyWith(
      authStatus: LocalAuthStatus.authenticating
    );

    final (didAuthenticate, msg) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      authStatus: didAuthenticate ? LocalAuthStatus.authenticated : LocalAuthStatus.notAuthenticated,
      message: msg,
    );

    return (didAuthenticate, msg);
  }
}

enum LocalAuthStatus { authenticated, notAuthenticated, authenticating }

class LocalAuthState {
  final LocalAuthStatus authStatus;
  final String message;

  const LocalAuthState({
    this.authStatus = LocalAuthStatus.notAuthenticated,
    this.message = '',
  });

  bool get didAuthenticate => authStatus == LocalAuthStatus.authenticated;

  LocalAuthState copyWith({
    LocalAuthStatus? authStatus,
    String? message,
  }) => LocalAuthState(
    authStatus: authStatus ?? this.authStatus,
    message: message ?? this.message,
  );

  @override
  String toString() {
    return 
'''
      didAuthenticate: $didAuthenticate
      authStatus: $authStatus
      message: $message
''';
  }
}