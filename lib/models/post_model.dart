import 'package:flutter/material.dart';
import 'package:flutterbook/models/user_model.dart';

class PostModel {
  String id;
  String code;
  int answers;
  DateTime date;
  bool isRead;
  UserModel user;
  String text;
  int version;

  PostModel({
    @required this.id,
    @required this.code,
    @required this.answers,
    @required this.date,
    @required this.isRead,
    @required this.user,
    @required this.text,
    @required this.version,
  });

  Map<String, dynamic> toMap() {
    Map result = new Map();
    result.putIfAbsent("ID", () => this.id);
    result.putIfAbsent("Codigo", () => this.code);
    result.putIfAbsent("Respostas", () => this.answers);
    result.putIfAbsent("DataHora", () => this.date);
    result.putIfAbsent("EstaLido", () => this.isRead);
    result.putIfAbsent("Texto", () => this.text);
    result.putIfAbsent("Versao", () => this.version);

    // UserModel
    result.putIfAbsent("user", () => this.user.toMap());
    return result;
  }

  PostModel.fromMap(Map data) {
    this.id = data["ID"] as String;
    this.code = data["Codigo"] as String;
    this.answers = data["Respostas"] as int;
    this.date = DateTime.fromMicrosecondsSinceEpoch(
      int.tryParse(data["DataHora"] as String),
    );
    this.isRead = data["EstaLido"] as bool;
    this.text = data["Texto"] as String;
    this.version = data["Versao"] as int;

    // UserModel
    if (data.containsKey("user")) {
      // From local database
      this.user = UserModel.fromMap(data["user"]);
    } else {
      // From api
      this.user = UserModel(
        id: data["AutorID"],
        name: data["AutorNome"],
        imageUrl: data["AutorImageUrl"],
      );
    }
  }
}
