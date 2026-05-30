import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/location/map_controller_provider.dart';
import 'package:miscelaneos/presentation/providers/location/watch_location_provider.dart';

class ControlledMapScreen extends ConsumerWidget {
  
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final watchUserLocation$ = ref.watch(watchLocationProvider);

    return Scaffold(
      body: watchUserLocation$.when(
        data: (data) => _MapAndControls(latitude: data.$1, longitude: data.$2), 
        error: (error, stackTrace) => Text('$error'), 
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

}

class _MapAndControls extends ConsumerWidget {

  final double latitude;
  final double longitude;

  const _MapAndControls({
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context, ref) {
    final mapController = ref.watch(mapControllerProvider);

    return Stack(
      children: [

        _MapsView(initialLatitude: latitude, initialLongitude: longitude),

        Positioned(
          top: 40.0,
          left: 20.0,
          child: IconButton.filledTonal(
            onPressed: () => context.pop(), 
            icon: Icon(Icons.arrow_back_outlined)
          ),
        ),

        if (mapController.isReady)
        ...[
          Positioned(
            bottom: 40.0,
            left: 20.0,
            child: IconButton.filledTonal(
              onPressed: ref.read(mapControllerProvider.notifier).findUser, 
              icon: Icon(Icons.location_searching_outlined),
            ),
          ),

          Positioned(
            bottom: 90.0,
            left: 20.0,
            child: IconButton.filledTonal(
              onPressed: ref.read(mapControllerProvider.notifier).toggleFollowUser, 
              icon: mapController.followUser
                ? Icon(Icons.directions_run_outlined)
                : Icon(Icons.accessibility_new_outlined),
            ),
          ),

          Positioned(
            bottom: 140.0,
            left: 20.0,
            child: IconButton.filledTonal(
              onPressed: ref.read(mapControllerProvider.notifier).setCurrentLocationMarker, 
              icon: Icon(Icons.location_pin),
            ),
          ),
        ],

      ],
    );
  }
}

class _MapsView extends ConsumerStatefulWidget {

  final double initialLatitude;
  final double initialLongitude;

  const _MapsView({
    required this.initialLatitude,
    required this.initialLongitude,
  });

  @override
  ConsumerState<_MapsView> createState() => __MapsViewState();

}

class __MapsViewState extends ConsumerState<_MapsView> {

  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);

    return GoogleMap(
      mapType: MapType.normal,
      markers: mapController.markersSet,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLatitude, widget.initialLongitude),
        zoom: 12,
      ),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapControllerProvider.notifier).setMapController(controller);
      },
      onLongPress: (position) => ref.read(mapControllerProvider.notifier).setNewMarker(
        position.latitude, 
        position.longitude, 
        'Marcador personalizado'
      ),
    );
  }

}