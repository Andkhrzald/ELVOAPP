import 'package:flutter/material.dart';

class BilahPencarian extends StatelessWidget {
  const BilahPencarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text('CARI...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
