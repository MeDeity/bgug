import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:json_annotation/json_annotation.dart';

part 'skin_list.g.dart';
///皮肤
@JsonSerializable()
class Skin {
  final String name;
  final String file;
  final int cost;

  Skin(this.name, this.file, this.cost);

  factory Skin.fromJson(Map<String, dynamic> json) => _$SkinFromJson(json);

  Map<String, dynamic> toJson() => _$SkinToJson(this);
}
///皮肤列表
@JsonSerializable()
class SkinList {
  final List<Skin> skins;

  SkinList(this.skins);

  factory SkinList.fromJson(Map<String, dynamic> json) => _$SkinListFromJson(json);

  Map<String, dynamic> toJson() => _$SkinListToJson(this);

  static Future<SkinList> fetch() async {
    String jsonStr = await rootBundle.loadString('assets/store-skins.json');
    return SkinList.fromJson(json.decode(jsonStr));
  }
}
