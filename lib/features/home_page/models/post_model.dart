import 'package:flutter/material.dart';
import 'package:flutterbook/features/home_page/models/user_model.dart';

class PostModel {
  String id;
  int answers;
  DateTime date;
  UserModel user;
  String text;
  bool isEdited;

  PostModel({
    @required this.id,
    @required this.answers,
    @required this.date,
    @required this.user,
    @required this.text,
    this.isEdited = false,
  });

  Map<String, dynamic> toMap() {
    Map result = new Map();
    result.putIfAbsent("ID", () => this.id);
    result.putIfAbsent("Respostas", () => this.answers);
    result.putIfAbsent("DataHora", () => this.date);
    result.putIfAbsent("Texto", () => this.text);
    result.putIfAbsent("isEdited", () => this.isEdited);
    // UserModel
    result.putIfAbsent("user", () => this.user.toMap());
    return result;
  }

  PostModel.fromMap(Map data) {
    this.id = data["ID"] as String;
    this.answers = data["Respostas"] as int;
    this.date = DateTime.fromMillisecondsSinceEpoch(
      int.tryParse(data["DataHora"] as String),
    );
    this.text = data["Texto"] as String;
    if (data.containsKey("isEdited")) {
      this.isEdited = data["isEdited"] as bool;
    } else {
      this.isEdited = false;
    }
    // UserModel
    if (data.containsKey("user")) {
      this.user = UserModel.fromMap(data["user"]);
    } else {
      this.user = UserModel(
        id: data["AutorID"],
        name: data["AutorNome"],
        imageUrl: data["AutorImageUrl"],
      );
    }
  }

  String get formattedDate {
    String day = date.day.toString();
    if (day.length == 1) {
      day = "0" + day;
    }
    String month = date.month.toString();
    if (month.length == 1) {
      month = "0" + month;
    }
    String year = date.year.toString();
    String hour = date.hour.toString();
    if (hour.length == 1) {
      hour = "0" + hour;
    }
    String minutes = date.minute.toString();
    if (minutes.length == 1) {
      minutes = "0" + minutes;
    }
    return day + "/" + month + "/" + year + " às " + hour + ":" + minutes;
  }
}
