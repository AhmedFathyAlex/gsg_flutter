import 'dart:convert';

class NoteModel {
  String title;
  String date;
  String content;
  int id;

  NoteModel({required this.title,
  required this.date,
   required this.content, 
   this.id = 0});

  String toJson(){
    return jsonEncode({"title": title,
     "date": date,
      "content": content});
  }

  NoteModel.fromJson(Map<String, dynamic> json) : 
    title = json['title'],
    date = json['date'],
    content = json['content'], 
    id = json['id'];
    
}


