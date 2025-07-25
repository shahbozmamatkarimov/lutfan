import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class BrandGrid extends StatefulWidget {
  final List<CategoryEntity> category;
  const BrandGrid({super.key, required this.category});

  @override
  _BrandGridState createState() => _BrandGridState();
}

class _BrandGridState extends State<BrandGrid> {
  int? selectedBrand; // Tanlangan brandni saqlash

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.category.map<Widget>((brand) {
          final isSelected = selectedBrand == brand.id; // Tanlanganmi?

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBrand = brand.id; // Brandni tanlash
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey[100], // Tanlangan bo‘lsa qora fonda
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(10),
                    child: Text(brand.icon, style: TextStyle(fontSize: 40),),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand.title!,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.black : const Color(0xFF272727), // Tanlangan bo‘lsa qora
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
