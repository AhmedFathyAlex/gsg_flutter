import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:gsg_flutter/todo/presentaion/provider/notes_provider.dart';
import 'package:gsg_flutter/todo/presentaion/widgets/note_item.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
   NotesScreen({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var notesProvider = Provider.of<NotesProvider>(context);

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

                        notesProvider.addNote(note);

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
      body: Consumer<NotesProvider>(builder: (context, provider, child) {
        return provider.notes.isEmpty ? 
        Center(child: Text('There is nothing to show')) : 
        ListView.builder(
                itemCount: provider.notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    note: provider.notes[index],
                    onDismissed: (direction) {
                      provider.deleteNote(provider.notes[index]);
                    },
                  );
                },
              );
      }
        
    )
    );
  }

}
