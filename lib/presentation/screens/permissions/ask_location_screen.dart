import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';

class AskLocationScreen extends ConsumerWidget {
  
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación necesaria')
      ),
      body: Center(
        child: FilledButton(
          onPressed: () => ref.read(permissionsProvider.notifier).requestLocationAccess(), 
          child: Text('Solicitar ubicación')
        ),
      ),
    );
  }

}