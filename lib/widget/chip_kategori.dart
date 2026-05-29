import 'package:flutter/material.dart';

class ChipKategori extends StatelessWidget {
  const ChipKategori({super.key});

  @override
  Widget build(BuildContext context) {
    final kategori = ['TERLARIS', 'PRIA', 'ANAK', 'WANITA', 'AKSESORIS'];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isActive = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: isActive ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black),
            ),
            alignment: Alignment.center,
            child: Text(
              kategori[index],
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemCount: kategori.length,
      ),
    );
  }
}
