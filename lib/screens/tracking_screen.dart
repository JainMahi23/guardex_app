import 'package:flutter/material.dart';
import 'dart:async';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  double position = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        position += 5;
        if (position > 300) timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Tracking")),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 320,
                  top: 300,
                  child: Icon(Icons.location_pin,
                      size: 50, color: Colors.red),
                ),
                Positioned(
                  left: position,
                  top: 300,
                  child: Icon(Icons.local_hospital,
                      size: 50, color: Colors.blue),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text("I am Safe"),
          )
        ],
      ),
    );
  }
}