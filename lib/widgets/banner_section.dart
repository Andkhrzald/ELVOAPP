import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1200 : double.infinity,
            ),
            child: AspectRatio(
              // 🔥 jaga rasio gambar
              aspectRatio: isDesktop ? 16 / 6 : 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image/enjoyTheSpring.jpg',
                  fit: BoxFit.cover, // ← CSS: background-size: cover
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
