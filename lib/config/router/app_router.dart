import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/home/home_screen.dart';
import 'package:miscelaneos/presentation/screens/permissions/permissions_screen.dart';
import 'package:miscelaneos/presentation/screens/sensors/accelerometer_screen.dart';
import 'package:miscelaneos/presentation/screens/sensors/compass_screen.dart';
import 'package:miscelaneos/presentation/screens/sensors/gyroscope_ball_screen.dart';
import 'package:miscelaneos/presentation/screens/sensors/gyroscope_screen.dart';
import 'package:miscelaneos/presentation/screens/sensors/magnetometer_screen.dart';

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
  
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => GyroscopeScreen(),
    ),

    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => AccelerometerScreen(),
    ),

    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => MagnetometerScreen(),
    ),

    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => GyroscopeBallScreen(),
    ),

    GoRoute(
      path: '/compass',
      builder: (context, state) => CompassScreen(),
    ),
  ]
);