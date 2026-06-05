import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/ads/ad_full_screen.dart';
import 'package:miscelaneos/presentation/screens/ads/ad_rewarded_screen.dart';
import 'package:miscelaneos/presentation/screens/badge/badge_screen.dart';
import 'package:miscelaneos/presentation/screens/biometrics/biometric_screen.dart';
import 'package:miscelaneos/presentation/screens/home/home_screen.dart';
import 'package:miscelaneos/presentation/screens/location/controlled_map_screen.dart';
import 'package:miscelaneos/presentation/screens/location/location_screen.dart';
import 'package:miscelaneos/presentation/screens/location/maps_screen.dart';
import 'package:miscelaneos/presentation/screens/permissions/permissions_screen.dart';
import 'package:miscelaneos/presentation/screens/pokemons/pokemon_screen.dart';
import 'package:miscelaneos/presentation/screens/pokemons/pokemons_screen.dart';
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

    GoRoute(
      path: '/pokemons',
      builder: (context, state) => PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => PokemonScreen(id: state.pathParameters['id'] ?? ''),
        ),
      ]
    ),

    GoRoute(
      path: '/biometrics',
      builder: (context, state) => BiometricScreen(),
    ),

    GoRoute(
      path: '/location',
      builder: (context, state) => LocationScreen(),
    ),

    GoRoute(
      path: '/maps',
      builder: (context, state) => MapsScreen(),
    ),

    GoRoute(
      path: '/controlled-map',
      builder: (context, state) => ControlledMapScreen(),
    ),

    GoRoute(
      path: '/badge',
      builder: (context, state) => BadgeScreen(),
    ),

    GoRoute(
      path: '/ad-fullscreen',
      builder: (context, state) => AdFullScreen(),
    ),

    GoRoute(
      path: '/ad-rewarded',
      builder: (context, state) => AdRewardedScreen(),
    ),
  ]
);