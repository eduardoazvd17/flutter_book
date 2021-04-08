import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String imageUrl;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    Map result = new Map();
    result.putIfAbsent("AutorID", () => this.id);
    result.putIfAbsent("AutorNome", () => this.name);
    result.putIfAbsent("AutorImageUrl", () => this.imageUrl);
    return result;
  }

  UserModel.fromMap(Map data) {
    this.id = data["AutorID"];
    this.name = data["AutorNome"];
    this.imageUrl = data["AutorImageUrl"];
  }
}
