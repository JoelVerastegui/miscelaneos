import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/compass/compass_provider.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';
import 'package:miscelaneos/presentation/screens/permissions/ask_location_screen.dart';

class CompassScreen extends ConsumerWidget {
  
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;
    final headings$ = ref.watch(compassProvider);

    if (!locationGranted) {
      return AskLocationScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Brújula'),
      ),
      body: Center(
        child: headings$.when(
          data:(heading) => _Compass(heading ?? 0),
          error: (error, stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }

}

class _Compass extends StatefulWidget {

  final double heading;

  const _Compass(this.heading);

  @override
  State<_Compass> createState() => _CompassState();

}

class _CompassState extends State<_Compass> {

  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {

    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction): direction;

    double diff = direction - prevValue;
    if(diff.abs() > 180) {

      if(prevValue > direction) {
        diff = 360 - (direction-prevValue).abs();
      } else {
        diff = 360 - (prevValue-direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Text('${widget.heading.ceil()}°', style: TextStyle(color: Colors.white, fontSize: 30.0)),
      
          SizedBox(height: 20.0),
      
          Stack(
            alignment: Alignment.center,
            children: [

              AnimatedRotation(
                curve: Curves.easeOut,
                turns: getTurns(), 
                duration: const Duration(milliseconds: 500),
                child: Image.asset('assets/images/compass/quadrant-1.png'),
              ),

              Image.asset('assets/images/compass/needle-1.png'),
      
            ],
          )
      
        ],
      ),
    );
  }

}