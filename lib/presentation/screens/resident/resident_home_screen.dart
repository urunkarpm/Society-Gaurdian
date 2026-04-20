import 'package:flutter/material.dart';

/// Resident Home Screen - Placeholder
class ResidentHomeScreen extends StatelessWidget {
  const ResidentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resident Home'),
      ),
      body: const Center(
        child: Text('Resident Home Screen'),
      ),
    );
  }
}

/// Admin Dashboard Screen - Placeholder
class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: const Center(
        child: Text('Admin Dashboard Screen'),
      ),
    );
  }
}
