import 'dart:convert';

class NoteModel {
  String title;
  String date;
  String content;

  NoteModel({required this.title,
  required this.date,
   required this.content});

  String toJson(){
    return jsonEncode({"title": title,
     "date": date,
      "content": content});
  }

  NoteModel.fromJson(Map<String, dynamic> json) : 
    title = json['title'],
    date = json['date'],
    content = json['content'];
    
}



