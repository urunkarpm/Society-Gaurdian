import 'package:flutter/material.dart';

class AmenityListScreen extends StatelessWidget {
  const AmenityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amenities')),
      body: const Center(child: Text('Amenities List')),
    );
  }
}
