import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2C0C0), // Soft purple color
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2C0C0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: _searchBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // CATEGORY (BEST SELLER, MEN, WOMEN, dll)
            _categoryChips(),

            const SizedBox(height: 20),

            // 🔥 RESPONSIVE BANNER (INTI SOLUSI)
            _bannerSection(context),

            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'BEST SELLER PRODUCT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            _productGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  // ================= SEARCH BAR =================
  Widget _searchBar() {
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
          Text('CARI.......', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ================= CATEGORY =================
  Widget _categoryChips() {
    final categories = ['BEST SELLER', 'MEN', 'KIDS', 'WOMEN', 'ACCESSORIES'];

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
              categories[index],
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: categories.length,
      ),
    );
  }

  // ================= RESPONSIVE BANNER =================
  Widget _bannerSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1200 : double.infinity, // CSS: max-width
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AspectRatio(
                // desktop & mobile beda rasio (CSS-like)
                aspectRatio: isDesktop
                    ? 10 / 6
                    : 16 /
                          9, // ini jangan di ubah ya gpt 10/6 mobile 16/9 desktop
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/image/enjoyTheSpring.png',
                    fit: BoxFit.cover, // CSS: background-size: cover
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ================= PRODUCT GRID =================
  Widget _productGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 4 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Product Image',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // ================= BOTTOM NAV =================
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
