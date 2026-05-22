import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

final List<MenuItem> menuItems = [
  MenuItem(title: 'Giroscopio', icon: Icons.downloading, route: '/gyroscope'),
  MenuItem(title: 'Acelerómetro', icon: Icons.speed, route: '/accelerometer'),
  MenuItem(title: 'Magnetómetro', icon: Icons.explore_outlined, route: '/magnetometer'),
  MenuItem(title: 'Giroscopio Ball', icon: Icons.sports_baseball_outlined, route: '/gyroscope-ball'),
  MenuItem(title: 'Brújula', icon: Icons.explore, route: '/compass'),
  MenuItem(title: 'Pokemons', icon: Icons.catching_pokemon, route: '/pokemons'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: menuItems.map((item) => _HomeMenuItem(
        title: item.title,
        route: item.route,
        icon: item.icon,
      ),).toList(),
    );
  }
}

class _HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;

  const _HomeMenuItem({
    required this.title, 
    required this.route, 
    required this.icon, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: const [Colors.lightBlue, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
      
            Icon(icon, color: Colors.white, size: 40.0),
      
            Text(title, style: TextStyle(color: Colors.white)),
      
          ],
        ),
      ),
    );
  }
}