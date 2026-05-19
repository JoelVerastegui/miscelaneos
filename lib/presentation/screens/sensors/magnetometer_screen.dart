import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/sensors/magnetometer_provider.dart';

class MagnetometerScreen extends ConsumerWidget {
  
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final magnetometer$ = ref.watch(magnetometerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Magnetómetro'),
      ),
      body: Center(
        child: magnetometer$.when(
          data: (data) => Text(
            data.toString(),
            style: TextStyle(fontSize: 30),
          ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }

}