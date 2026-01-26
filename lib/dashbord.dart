import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false, // hilangkan tombol back
      ),
      body: const Center(
        child: Text(
          "Selamat datang di Dashboard 🎉",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
