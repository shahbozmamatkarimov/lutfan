import 'package:flutter/material.dart';

class BrandGrid extends StatefulWidget {
  const BrandGrid({super.key});

  @override
  _BrandGridState createState() => _BrandGridState();
}

class _BrandGridState extends State<BrandGrid> {
  String? selectedBrand; // Tanlangan brandni saqlash

  final List<Map<String, String>> brands = [
    {
      'name': 'Hoodies',
      'logo':
          'https://eu.pangaia.com/cdn/shop/products/Recycled-Cotton-Hoodie-Navy-1.png?crop=center&height=1999&v=1720190018&width=1500'
    },
    {
      'name': 'Shoes',
      'logo':
          'https://static.nike.com/a/images/t_default/450ed1df-8e17-4d87-a244-85697874661c/NIKE+REVOLUTION+7.png'
    },
    {
      'name': 'Bags',
      'logo':
          'https://uppercase.co.in/cdn/shop/files/2900edb1blu_01.png?v=1738227865'
    },
    {
      'name': 'Accessories',
      'logo':
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MA7E4?wid=532&hei=582&fmt=png-alpha&.v=1723930332796'
    },
    {
      'name': 'Hoodies1',
      'logo':
          'https://eu.pangaia.com/cdn/shop/products/Recycled-Cotton-Hoodie-Navy-1.png?crop=center&height=1999&v=1720190018&width=1500'
    },
    {
      'name': 'Shoes1',
      'logo':
          'https://static.nike.com/a/images/t_default/450ed1df-8e17-4d87-a244-85697874661c/NIKE+REVOLUTION+7.png'
    },
    {
      'name': 'Bags1',
      'logo':
          'https://uppercase.co.in/cdn/shop/files/2900edb1blu_01.png?v=1738227865'
    },
    {
      'name': 'Accessories1',
      'logo':
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MA7E4?wid=532&hei=582&fmt=png-alpha&.v=1723930332796'
    },
    {
      'name': 'Hoodies2',
      'logo':
          'https://eu.pangaia.com/cdn/shop/products/Recycled-Cotton-Hoodie-Navy-1.png?crop=center&height=1999&v=1720190018&width=1500'
    },
    {
      'name': 'Shoes2',
      'logo':
          'https://static.nike.com/a/images/t_default/450ed1df-8e17-4d87-a244-85697874661c/NIKE+REVOLUTION+7.png'
    },
    {
      'name': 'Bags2',
      'logo':
          'https://uppercase.co.in/cdn/shop/files/2900edb1blu_01.png?v=1738227865'
    },
    {
      'name': 'Accessories2',
      'logo':
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MA7E4?wid=532&hei=582&fmt=png-alpha&.v=1723930332796'
    },
    {
      'name': 'Hoodies3',
      'logo':
          'https://eu.pangaia.com/cdn/shop/products/Recycled-Cotton-Hoodie-Navy-1.png?crop=center&height=1999&v=1720190018&width=1500'
    },
    {
      'name': 'Shoes3',
      'logo':
          'https://static.nike.com/a/images/t_default/450ed1df-8e17-4d87-a244-85697874661c/NIKE+REVOLUTION+7.png'
    },
    {
      'name': 'Bags3',
      'logo':
          'https://uppercase.co.in/cdn/shop/files/2900edb1blu_01.png?v=1738227865'
    },
    {
      'name': 'Accessories3',
      'logo':
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MA7E4?wid=532&hei=582&fmt=png-alpha&.v=1723930332796'
    },
    {
      'name': 'Hoodies4',
      'logo':
          'https://eu.pangaia.com/cdn/shop/products/Recycled-Cotton-Hoodie-Navy-1.png?crop=center&height=1999&v=1720190018&width=1500'
    },
    {
      'name': 'Shoes4',
      'logo':
          'https://static.nike.com/a/images/t_default/450ed1df-8e17-4d87-a244-85697874661c/NIKE+REVOLUTION+7.png'
    },
    {
      'name': 'Bags4',
      'logo':
          'https://uppercase.co.in/cdn/shop/files/2900edb1blu_01.png?v=1738227865'
    },
    {
      'name': 'Accessories4',
      'logo':
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MA7E4?wid=532&hei=582&fmt=png-alpha&.v=1723930332796'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: brands.map<Widget>((brand) {
          final isSelected = selectedBrand == brand['name']; // Tanlanganmi?

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBrand = brand['name']; // Brandni tanlash
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
                    padding: const EdgeInsets.all(4),
                    child: Image.network(
                      brand['logo']!,
                      height: 56,
                      width: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand['name']!,
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
