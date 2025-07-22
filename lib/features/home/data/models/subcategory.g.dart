// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
      id: (json['id'] as num).toInt(),
      icon: json['icon'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'title': instance.title,
    };
