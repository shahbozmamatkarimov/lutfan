import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;

  @JsonKey(name: 'full_name')
  final String fullName;

  final String? username;
  final String phone;
  final List<String>? phones;

  @JsonKey(name: 'tg_usernames')
  final List<String>? tgUsernames;

  final List<String>? locations;
  final int? limit;

  final String? bio;
  final String? image;
  final bool? status;

  @JsonKey(name: 'is_blocked')
  final bool? isBlocked;

  User({
    required this.id,
    required this.fullName,
    this.username,
    required this.phone,
    this.phones,
    this.tgUsernames,
    this.locations,
    this.limit,
    this.bio,
    this.image,
    this.status,
    this.isBlocked,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
