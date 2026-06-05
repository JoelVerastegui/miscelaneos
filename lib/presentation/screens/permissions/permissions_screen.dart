import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/ads/show_ads_provider.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permisos'),
      ),
      body: _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, ref) {
    final permissions = ref.watch(permissionsProvider);
    final showAds = ref.watch(showAdsProvider);

    return ListView(
      children: [
        _CheckboxListTileView(
          value: permissions.cameraGranted,
          title: 'Cámara',
          subtitle: '${permissions.camera}',
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestCameraAccess(),
        ),

        _CheckboxListTileView(
          value: permissions.photoLibraryGranted,
          title: 'Galería',
          subtitle: '${permissions.photoLibrary}',
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess(),
        ),
        
        _CheckboxListTileView(
          value: permissions.locationGranted,
          title: 'Location',
          subtitle: '${permissions.location}',
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestLocationAccess(),
        ),
        
        _CheckboxListTileView(
          value: permissions.sensorGranted,
          title: 'Sensores',
          subtitle: '${permissions.sensors}',
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestSensorsAccess(),
        ),

        _CheckboxListTileView(
          value: showAds,
          title: 'Show Ads',
          subtitle: 'Esta opción muestra y oculta ads',
          onChanged: (_) => ref.read(showAdsProvider.notifier).toggleAds(),
        ),
      ],
    );
  }
}

class _CheckboxListTileView extends StatelessWidget {
  final bool value;
  final String title;
  final String subtitle;
  final Function(bool?)? onChanged;

  const _CheckboxListTileView({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle), 
      onChanged: onChanged,
    );
  }
}