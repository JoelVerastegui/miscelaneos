import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapControllerProvider = StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  return MapNotifier();
});

class MapNotifier extends StateNotifier<MapState> {

  StreamSubscription? userLocationSubscription;
  (double, double)? lastLocationKnown;
  
  MapNotifier(): super(MapState()) {
    trackUser().listen((event) => lastLocationKnown = (event.$1, event.$2));
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isReady: true);
  }

  void goToLocation(double lat, double lng) {
    if (state.controller == null) return;

    state.controller!.animateCamera(
      CameraUpdate.newLatLng(LatLng(lat, lng))
    );
  }

  Stream<(double, double)> trackUser() async* {
    await for(final location in Geolocator.getPositionStream()) {
      yield (location.latitude, location.longitude);
    }
  }

  void toggleFollowUser() {
    state = state.copyWith(followUser: !state.followUser);

    if (state.followUser) {
      findUser();
      userLocationSubscription = trackUser().listen((event) {
        goToLocation(event.$1, event.$2);
      });
    } else {
      userLocationSubscription?.cancel();
    }
  }

  void findUser() async {
    if (lastLocationKnown == null) return;

    final (lat, lng) = lastLocationKnown!;

    goToLocation(lat, lng);
  }

  void setNewMarker(double latitude, double longitude, String name) {
    final newMarker = Marker(
      markerId: MarkerId('${state.markers.length}'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: name,
        snippet: 'Por aquí su batallón'
      )
    );

    state = state.copyWith(markers: [...state.markers, newMarker]);
  }

  void setCurrentLocationMarker() {
    if (lastLocationKnown == null) return;

    final (latitude, longitude) = lastLocationKnown!;

    setNewMarker(latitude, longitude, 'Por aquí pasó colón');
  }
  
}

class MapState {

  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState({
    this.isReady = false,
    this.followUser = false,
    this.markers = const [],
    this.controller,
  });

  Set<Marker> get markersSet => Set.from(markers);

  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) => MapState(
    isReady: isReady ?? this.isReady,
    followUser: followUser ?? this.followUser,
    markers: markers ?? this.markers,
    controller: controller ?? this.controller,
  );

}