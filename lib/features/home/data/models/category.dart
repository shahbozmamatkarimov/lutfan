import 'package:lutfan/features/home/data/models/subcategory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String icon;
  final String title;
  final List<Subcategory> subcategories;

  Category({
    required this.id,
    required this.icon,
    required this.title,
    required this.subcategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
