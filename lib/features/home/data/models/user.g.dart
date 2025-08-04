// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      phone: json['phone'] as String,
      phones:
          (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tgUsernames: (json['tg_usernames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      limit: (json['limit'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      image: json['image'] as String?,
      status: json['status'] as bool?,
      isBlocked: json['is_blocked'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'phone': instance.phone,
      'phones': instance.phones,
      'tg_usernames': instance.tgUsernames,
      'locations': instance.locations,
      'limit': instance.limit,
      'bio': instance.bio,
      'image': instance.image,
      'status': instance.status,
      'is_blocked': instance.isBlocked,
    };
