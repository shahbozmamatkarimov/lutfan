import 'package:ecommerceapp/features/home/data/models/subcategory.dart';

class CategoryEntity {
  final int id;
  final String icon;
  final String title;
  final List<Subcategory> subcategories;

  CategoryEntity({
    required this.id,
    required this.icon,
    required this.title,
    required this.subcategories,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['id'],
      icon: json['icon'],
      title: json['title'],
      subcategories: List<Subcategory>.from(json['subcategories']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'subcategories': subcategories,
    };
  }

  // Optional: if you want to modify the object immutably
  CategoryEntity copyWith({
    int? id,
    String? title,
    String? price,
    List<String>? images,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      subcategories: subcategories ?? this.subcategories,
    );
  }
}
