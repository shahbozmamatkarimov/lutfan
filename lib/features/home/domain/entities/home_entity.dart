import 'package:lutfan/features/home/data/models/subcategory.dart';
import 'package:lutfan/features/home/data/models/user.dart';

class ProductEntity {
  final int id;
  final String title;
  final String price;
  final List<String> images;
  final User user;
  final Subcategory subcategory;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.user,
    required this.subcategory,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(), // convert int or double to String
      images: List<String>.from(json['images']),
      user: User.fromJson(json['user']),
      subcategory: Subcategory.fromJson(json['subcategory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'images': images,
      'user': user,
      'subcategory': subcategory
    };
  }

  // Optional: if you want to modify the object immutably
  ProductEntity copyWith({
    int? id,
    String? title,
    String? price,
    List<String>? images,
    User? user,
    Subcategory? subcategory,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      images: images ?? this.images,
      user: this.user,
      subcategory: this.subcategory,
    );
  }
}
