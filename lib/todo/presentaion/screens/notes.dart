import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:gsg_flutter/todo/data/notes_shared_db.dart';
import 'package:gsg_flutter/todo/data/notes_sqlite_db.dart';
import 'package:gsg_flutter/todo/presentaion/widgets/note_item.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NoteModel> notes = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(cont: titleController, hint: 'title'),
                    CustomTextField(cont: contentController, hint: 'content'),
                    ElevatedButton(
                      onPressed: ()async{
                         NoteModel note = NoteModel(
                          title: titleController.text,
                          content: contentController.text,
                          date: '${DateTime.now().day}/${DateTime.now().month}',
                        );

                        var id = await NotesSqliteDb.insertNoteToDb(note);
                          fetchList();
                        // note = NoteModel(
                        //   title: note.title,
                        //   content: note.content,
                        //   date: note.date,
                        //   id: id,
                        // );
                        // setState((){
                        //   notes.add(note);
                        // });
                         titleController.clear();
                        contentController.clear();
                         Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body:
          notes.isEmpty
              ? Center(child: Text('There is nothing to show'))
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    note: notes[index],
                    onDismissed: (direction) {
                      NotesSqliteDb.deleteNoteFromDb(notes[index]);
                      notes.removeAt(index);
                      
                      // NotesSharedDb.updateListAtSharedDb(notes);
                      if (notes.length == 0) {
                        setState(() {});
                      }
                    },
                  );
                },
              ),
    );
  }

  fetchList()async{
   var fetchedList = await NotesSqliteDb.getNotesFromDb();
    setState((){
     notes = fetchedList;
    });
    
  }
  
}
