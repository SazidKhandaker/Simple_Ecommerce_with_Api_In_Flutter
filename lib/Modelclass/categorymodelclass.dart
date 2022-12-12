// To parse this JSON data, do
//
//     final categoryModelclass = categoryModelclassFromJson(jsonString);

import 'dart:convert';

CategoryModelclass categoryModelclassFromJson(String str) =>
    CategoryModelclass.fromJson(json.decode(str));

String categoryModelclassToJson(CategoryModelclass data) =>
    json.encode(data.toJson());

class CategoryModelclass {
  CategoryModelclass({
    this.id,
    this.name,
    this.image,
    this.icon,
  });

  int? id;
  String? name;
  String? image;
  String? icon;

  factory CategoryModelclass.fromJson(Map<String, dynamic> json) =>
      CategoryModelclass(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "icon": icon,
      };
}
