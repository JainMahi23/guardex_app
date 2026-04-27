import 'package:flutter/material.dart';

class WomenSafetyScreen extends StatelessWidget {
  const WomenSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Women Safety Mode")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Emergency Alert Activated 🚨",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // future: send alert to contacts
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Alert Sent to Contacts")),
                );
              },
              child: const Text("Send Alert"),
            )
          ],
        ),
      ),
    );
  }
}