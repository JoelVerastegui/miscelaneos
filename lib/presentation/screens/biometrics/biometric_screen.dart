import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/biometrics/local_auth_providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final biometricsCheckAsync = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Biométricos'),
      ),      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: () => ref.read(localAuthProvider.notifier).authenticateUser(), 
              child: Text('Autenticar')
            ),

            biometricsCheckAsync.when(
              data: (canCheck) => Text('Puede revisar biométricos: $canCheck'),
              error: (error, stackTrace) => Text('Error: $error'), 
              loading: () => CircularProgressIndicator()
            ),

            SizedBox(height: 15.0),

            Text('Estado \n$localAuthState', style: TextStyle(fontSize: 15.0)),

          ],
        ),
      ),
    );
  }

}