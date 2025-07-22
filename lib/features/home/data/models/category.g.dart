// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num).toInt(),
      icon: json['icon'] as String,
      title: json['title'] as String,
      subcategories: (json['subcategories'] as List<dynamic>)
          .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'title': instance.title,
      'subcategories': instance.subcategories,
    };
