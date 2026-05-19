import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

    return ListView(
      children: [
        _CheckboxListTileView(
          value: permissions.cameraGranted,
          title: 'Cámara',
          status: permissions.camera,
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestCameraAccess(),
        ),

        _CheckboxListTileView(
          value: permissions.photoLibraryGranted,
          title: 'Galería',
          status: permissions.photoLibrary,
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess(),
        ),
        
        _CheckboxListTileView(
          value: permissions.locationGranted,
          title: 'Location',
          status: permissions.location,
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestLocationAccess(),
        ),
        
        _CheckboxListTileView(
          value: permissions.sensorGranted,
          title: 'Sensores',
          status: permissions.sensors,
          onChanged: (_) => ref.read(permissionsProvider.notifier).requestSensorsAccess(),
        ),
      ],
    );
  }
}

class _CheckboxListTileView extends StatelessWidget {
  final bool value;
  final String title;
  final PermissionStatus status;
  final Function(bool?)? onChanged;

  const _CheckboxListTileView({
    required this.value,
    required this.title,
    required this.status,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      subtitle: Text('$status'), 
      onChanged: onChanged,
    );
  }
}