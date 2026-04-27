import 'package:flutter/material.dart';
import 'tracking_screen.dart';

class ResponderScreen extends StatelessWidget {
  final String type;

  const ResponderScreen(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help Connected")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.verified, color: Colors.green, size: 80),
            const SizedBox(height: 20),

            Text(
              "$type team is on the way 🚑",
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TrackingScreen(),
                  ),
                );
              },
              child: const Text("Track Help Live"),
            ),
          ],
        ),
      ),
    );
  }
}