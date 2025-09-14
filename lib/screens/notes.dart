import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/note_model.dart';
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
                  return Dismissible(
                    background: Container(color: Colors.red),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      notes.removeAt(index);
                      updateList();
                      if (notes.length == 0) {
                        setState(() {});
                      }
                    },
                    child: ListTile(
                      title: Text(notes[index].title),
                      subtitle: Text(notes[index].content),
                      trailing: InkWell(
                        onTap: () {
                          print('aaaa');
                          print(notes[index].toJson());
                        },
                        child: Text(notes[index].date),
                      ),
                    ),
                  );
                },
              ),
    );
  }

  updateList() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setStringList(notesKey, notes);
  }

  fetchList() async {
    //   final prefs = await SharedPreferences.getInstance();
    //   setState(() {
    //     notes = prefs.getStringList(notesKey) ?? [];
    //   });
  }
}
