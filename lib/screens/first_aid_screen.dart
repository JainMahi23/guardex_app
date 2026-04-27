import 'package:flutter/material.dart';

class FirstAidScreen extends StatelessWidget {
  final String type;
  const FirstAidScreen(this.type, {super.key});

  String getInstructions() {
    switch (type) {
      case "Medical":
        return "• Stay calm\n• Check breathing\n• Call ambulance\n• Give CPR if needed";
      case "Fire":
        return "• Move away from fire\n• Use extinguisher\n• Cover nose with cloth";
      case "Police":
        return "• Stay in safe place\n• Avoid confrontation\n• Share location";
      case "Women Safety":
        return "• Move to safe/public area\n• Call trusted contact\n• Stay alert";
      default:
        return "Stay calm and wait for help";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Aid Help"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.health_and_safety,
                  size: 60,
                  color: Colors.red,
                ),
                const SizedBox(height: 20),

                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Divider(),

                Text(
                  getInstructions(),
                  style: const TextStyle(fontSize: 18),
                ),

                // 🤖 AI Suggestion Section
                const SizedBox(height: 20),
                const Text(
                  "🤖 AI Suggestion:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Based on your emergency, stay calm and follow the steps carefully. Help is being arranged.",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}