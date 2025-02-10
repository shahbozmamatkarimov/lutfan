import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  String selectedCategory = 'All'; // Tanlangan kategoriya

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Nike',
      'Adidas',
      'Puma',
      'Asics',
      'Nike1',
      'Adidas1',
      'Puma1',
      'Asics1',
      'Nike2',
      'Adidas2',
      'Puma2',
      'Asics2'
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  selectedCategory = category; // Kategoriyani yangilash
                });
              },
              selectedColor: isSelected ? Colors.black : Colors.white,
              backgroundColor: isSelected ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              checkmarkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? Colors.transparent : Colors.grey[300]!,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
