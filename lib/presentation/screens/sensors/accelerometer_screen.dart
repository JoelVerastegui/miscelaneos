import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/sensors/accelerometer_providers.dart';

class AccelerometerScreen extends ConsumerStatefulWidget {
  
  const AccelerometerScreen({super.key});

  @override
  ConsumerState<AccelerometerScreen> createState () => _AccelerometerStateScreen();
}

class _AccelerometerStateScreen extends ConsumerState<AccelerometerScreen> {

  bool isGravity = true;
  
  @override
  Widget build(BuildContext context) {
    final accelerometerGravity$ = ref.watch(accelerometerGravityProvider);
    final accelerometerUser$ = ref.watch(accelerometerUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Acelerómetro'),
        actionsPadding: EdgeInsets.only(right: 20.0),
        actions: [
          isGravity
            ? Icon(Icons.timer_outlined)
            : Icon(Icons.directions_run_outlined),
        ]
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15.0,
        children: [

          FloatingActionButton(
            heroTag: 1,
            onPressed: () => setState(() => isGravity = true),
            child: Icon(Icons.timer_outlined),
          ),

          FloatingActionButton(
            heroTag: 2,
            onPressed: () => setState(() => isGravity = false),
            child: Icon(Icons.directions_run_outlined),
          ),

        ],
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isGravity
            ? accelerometerGravity$.when(
              data: (data) => Text(data.toString(), style: TextStyle(fontSize: 30)), 
              error: (error, stackTrace) => Text('$error'), 
              loading: () => CircularProgressIndicator(),
            )
            : accelerometerUser$.when(
              data: (data) => Text(data.toString(), style: TextStyle(fontSize: 30)), 
              error: (error, stackTrace) => Text('$error'), 
              loading: () => CircularProgressIndicator(),
            ),
        ),
      ),
    );
  }

}