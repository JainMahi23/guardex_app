// import 'package:flutter/material.dart';

// class WomenSafetyScreen extends StatelessWidget {
//   const WomenSafetyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(title: const Text("Women Safety Mode")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Emergency Alert Activated 🚨",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // future: send alert to contacts
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Alert Sent to Contacts")),
//                 );
//               },
//               child: const Text("Send Alert"),
//             )
//           ],
//         ),
//       ),
//     );
  // }
// }
import 'package:flutter/material.dart';
import '../services/alert_service.dart';
import 'tracking_screen.dart';

class WomenSafetyScreen extends StatelessWidget {
  const WomenSafetyScreen({super.key});

  Future<void> sendAlert(BuildContext context) async {
    await AlertService.triggerSOS();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🚨 SOS Alert Sent")),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const TrackingScreen(),
      ),
    );
  }

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
              "🚨 Women Safety Active",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              onPressed: () => sendAlert(context),
              child: const Text("SEND SOS"),
            ),
          ],
        ),
      ),
    );
  }
}
