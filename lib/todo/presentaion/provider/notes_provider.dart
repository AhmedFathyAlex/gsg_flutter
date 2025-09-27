import 'package:flutter/widgets.dart';
import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:gsg_flutter/todo/data/notes_sqlite_db.dart';

class NotesProvider extends ChangeNotifier {
  // data
 List<NoteModel> notes = [];

  // operations
  void addNote(NoteModel note)async{
    var id = await NotesSqliteDb.insertNoteToDb(note);
    note = NoteModel(
      title: note.title,
      content: note.content,
      date: note.date,
      id: id,
    );
    notes.add(note);
    notifyListeners(); // setState for groups
  }

  void updateNote(NoteModel updatedNote) {
    NotesSqliteDb.updateNoteFromDb(updatedNote);
    int index = notes.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      notes[index] = updatedNote;
    }
    notifyListeners();
  }

  void deleteNote(NoteModel noteModel) {
    NotesSqliteDb.deleteNoteFromDb(noteModel);
    notes.removeWhere((note) => note.id == noteModel.id);
    notifyListeners();
  }

  void readAllNotes()async{
    var fetchedNotes = await NotesSqliteDb.getNotesFromDb();
    notes = fetchedNotes;
    notifyListeners();
  }


}