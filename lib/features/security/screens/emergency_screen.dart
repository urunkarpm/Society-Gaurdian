import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.sos, size: 100, color: Colors.red),
              onPressed: () {
                // TODO: Trigger SOS
              },
            ),
            const Text('Tap for Emergency Assistance'),
          ],
        ),
      ),
    );
  }
}
