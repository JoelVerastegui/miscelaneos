import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/location/user_location_provider.dart';

class MapsScreen extends ConsumerWidget {
  
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userLocationAsync = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas'),
      ),
      body: userLocationAsync.when(
        data: (data) => _MapsView(initialLatitude: data.$1, initialLongitude: data.$2), 
        error: (error, stackTrace) => Text('$error'), 
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

}

class _MapsView extends StatefulWidget {

  final double initialLatitude;
  final double initialLongitude;

  const _MapsView({
    required this.initialLatitude,
    required this.initialLongitude,
  });

  @override
  State<_MapsView> createState() => __MapsViewState();

}

class __MapsViewState extends State<_MapsView> {

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLatitude, widget.initialLongitude),
        zoom: 12,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        // _controller.complete(controller);
      },
    );
  }

}