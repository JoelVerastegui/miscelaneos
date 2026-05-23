import 'package:local_auth/local_auth.dart';

class LocalAuthPlugin {

  static LocalAuthentication auth = LocalAuthentication();

  static Future<void> availableBiometrics() async {
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Por favor autentícate para continuar',
        // biometricOnly: true,
      );

      return (didAuthenticate, didAuthenticate ? 'Hecho' : 'Cancelado por el usuario');
    } on LocalAuthException catch (e) {
      if (e.code == LocalAuthExceptionCode.noBiometricsEnrolled) return (false, 'No hay biométricos enrolados');
      if (e.code == LocalAuthExceptionCode.temporaryLockout) return (false, 'Muchos intentos fallidos');
      if (e.code == LocalAuthExceptionCode.uiUnavailable) return (false, 'No hay biométricos disponibles');
      if (e.code == LocalAuthExceptionCode.noCredentialsSet) return (false, 'No hay un PIN configurado');
      if (e.code == LocalAuthExceptionCode.biometricLockout) return (false, 'Se requiere desbloquear el teléfono de nuevo');
      if (e.code == LocalAuthExceptionCode.userCanceled) return (false, 'Autenticación cancelada');
      return (false, '$e');
    }
  }

}