import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';
import 'emergency_type_screen.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int seconds = 5;
  Timer? timer;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    startAlert();
  }

  Future<void> startAlert() async {
    // 🔊 Alarm
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource('alarm.mp3'));

    // 📳 Vibration
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 500, 300, 500], repeat: 0);
    }

    // ⏳ Countdown
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
        player.stop();
        Vibration.cancel();

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const EmergencyTypeScreen(),
          ),
        );
      } else {
        setState(() => seconds--);
      }
    });
  }

  void cancelSOS() {
    timer?.cancel();
    player.stop();
    Vibration.cancel();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    timer?.cancel();
    player.dispose();
    Vibration.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("🚨 ALERT TRIGGERED",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            const SizedBox(height: 20),
            Text(
              "$seconds",
              style: const TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: cancelSOS,
              child: const Text("CANCEL"),
            )
          ],
        ),
      ),
    );
  }
}