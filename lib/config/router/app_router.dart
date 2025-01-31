import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/home/home_screen.dart';
import 'package:miscelaneos/presentation/screens/permissions/permissions_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/permissions',
      builder: (context, state) => PermissionsScreen(),
    ),
  ]
);