import 'package:lutfan/features/home/data/models/subcategory.dart';

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
      subcategories: (json['subcategories'] as List)
          .map((item) => Subcategory.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'subcategories': subcategories.map((e) => e.toJson()).toList(),
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
      icon: icon,
      title: title ?? this.title,
      subcategories: subcategories,
    );
  }
}
