import 'dart:convert';

class NoteModel {
  String title;
  String date;
  String content;

  NoteModel({required this.title,required this.date, required this.content});

  String toJson(){
    return jsonEncode(this);
  }
}



