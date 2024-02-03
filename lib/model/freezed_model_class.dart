import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'freezed_model_class.freezed.dart';
part 'freezed_model_class.g.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
