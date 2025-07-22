import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  final List<CategoryEntity> category;

  const CategoryFilter({super.key, required this.category});

  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  String selectedCategory = 'All'; // Tanlangan kategoriya

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: (widget.category ?? []).map((category) {
          final isSelected = category == selectedCategory;
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category.title),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  selectedCategory = "$category.id"; // Kategoriyani yangilash
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
