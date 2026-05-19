import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/sensors/gyroscope_provider.dart';

class GyroscopeScreen extends ConsumerWidget {
  
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Giroscópio'),
      ),
      body: Center(
        child: gyroscope$.when(
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