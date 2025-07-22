import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final String price;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
