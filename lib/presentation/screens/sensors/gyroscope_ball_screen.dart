import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/sensors/gyroscope_provider.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Giroscópio'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (data) => _MovingBall(x: data.x, y: data.y),
          error: (error, stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }

}

class _MovingBall extends StatelessWidget {

  final double x;
  final double y;

  const _MovingBall({ required this.x, required this.y });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final deviceWidth = size.width;
    final deviceHeight = size.height;

    final currentXPos = (x * 150);
    final currentYPos = (y * 150);

    return Stack(
      alignment: Alignment.center,
      children: [

        AnimatedPositioned(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          left: (currentYPos - 25) + (deviceWidth / 2),
          top: (currentXPos - 25) + (deviceHeight / 2),
          child: _Ball(), 
        ),

        Text(
          '''
x: $x,
y: $y
''',
          style: TextStyle(fontSize: 30.0),
        ),

      ],
    );
  }

}

class _Ball extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue.shade400,
            Colors.blue.shade800,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
    );
  }

}