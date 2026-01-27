class CategoryChip extends StatelessWidget {
  final String text;
  final bool selected;

  const CategoryChip({super.key, required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
