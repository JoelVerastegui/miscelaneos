import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/location/user_location_provider.dart';
import 'package:miscelaneos/presentation/providers/location/watch_location_provider.dart';

class LocationScreen extends ConsumerWidget {
  
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocation$ = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación'),
      ),
      body: Center(
        child: Column(
          children: [

            Text('Ubicación actual'),

            userLocationAsync.when(
              data: (data) => Text('$data'), 
              error: (error, stackTrace) => Text('Error: $error'), 
              loading: () => CircularProgressIndicator(),
            ),

            SizedBox(height: 20.0),

            Text('Seguimiento de ubicación'),

            watchLocation$.when(
              data: (data) => Text('$data'), 
              error: (error, stackTrace) => Text('Error: $error'), 
              loading: () => CircularProgressIndicator(),
            ),

          ],
        ),
      ),
    );
  }

}