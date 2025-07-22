class ProductEntity {
  final int id;
  final String title;
  final String price;
  final List<String> images;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(), // convert int or double to String
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'images': images,
    };
  }

  // Optional: if you want to modify the object immutably
  ProductEntity copyWith({
    int? id,
    String? title,
    String? price,
    List<String>? images,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      images: images ?? this.images,
    );
  }
}
