import 'package:flutter/material.dart';
import 'first_aid_screen.dart';
import 'first_aid_screen.dart';
import 'women_safety_screen.dart';
class EmergencyTypeScreen extends StatelessWidget {
  const EmergencyTypeScreen({super.key});

  final List<Map<String, dynamic>> types = const [
    {"name": "Medical", "emoji": "🏥", "color": Colors.blue},
    {"name": "Fire", "emoji": "🔥", "color": Colors.red},
    {"name": "Police", "emoji": "🚔", "color": Colors.green},
    {"name": "Women Safety", "emoji": "🚨", "color": Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Select Emergency")),
      body: ListView.builder(
        itemCount: types.length,
        itemBuilder: (_, i) {
          final t = types[i];

          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text(
                t["emoji"],
                style: const TextStyle(fontSize: 30),
              ),
              title: Text(
                t["name"],
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            //   onTap: () {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text("${t["name"]} Selected")),
            //     );
            //   },
//             onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (_) => FirstAidScreen(t["name"]),
//     ),
//   );
// },
onTap: () {
  if (t["name"] == "Women Safety") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const WomenSafetyScreen(),
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FirstAidScreen(t["name"]),
      ),
    );
  }
},
            ),
          );
        },
      ),
    );
  }
}