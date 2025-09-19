import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:gsg_flutter/todo/presentaion/widgets/note_item.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NoteModel> notes = [];
  final String notesKey = 'notes';
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
                      onPressed: () {
                        setState(() {
                          NoteModel note = NoteModel(
                            title: titleController.text,
                            content: contentController.text,
                            date:
                                '${DateTime.now().day}/${DateTime.now().month}',
                          );

                          notes.add(note);
                          titleController.clear();
                          contentController.clear();
                          updateList();
                          Navigator.pop(context);
                        });
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
                      notes.removeAt(index);
                      updateList();
                      if (notes.length == 0) {
                        setState(() {});
                      }
                    },
                  );
                },
              ),
    );
  }

  updateList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notesAsStrings = [];
    for (var note in this.notes) {
      notesAsStrings.add(note.toJson());
    }
    prefs.setStringList(notesKey, notesAsStrings);
  }

  fetchList() async {
    final prefs = await SharedPreferences.getInstance();

    var notesAsStrings = prefs.getStringList(notesKey) ?? [];

    for (var n in notesAsStrings) {
      var noteDecoded = jsonDecode(n);
      NoteModel note = NoteModel.fromJson(noteDecoded);
      setState(() {
        notes.add(note);
      });
    }
  }
}
