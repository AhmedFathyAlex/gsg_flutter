import 'dart:convert';

import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesSharedDb {

  static late final SharedPreferences prefs;
  static final String notesKey = 'notes';

  static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
    print('SharedPrefs initialized');
  }

  static updateListAtSharedDb(List<NoteModel> notes) async {
    List<String> notesAsStrings = [];
    for (var note in notes) {
      notesAsStrings.add(note.toJson());
    }
    prefs.setStringList(notesKey, notesAsStrings);
  }

 static Future<List<NoteModel>> fetchListFromSharedDb() async {
    final prefs = await SharedPreferences.getInstance();
    var notesAsStrings = prefs.getStringList(notesKey) ?? [];

    List<NoteModel> notes = [];

    for (var n in notesAsStrings) {
      var noteDecoded = jsonDecode(n);
      NoteModel note = NoteModel.fromJson(noteDecoded);
      notes.add(note);
    }
    return notes;
  }
}