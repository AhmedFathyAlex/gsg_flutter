import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/note_model.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key, this.onDismissed, required this.note}) {
    contentController.text = note.content;
    titleController.text = note.title;
  }

  final void Function(DismissDirection)? onDismissed;
  final NoteModel note;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: UniqueKey(),
      onDismissed: onDismissed,
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
        trailing: Text(note.date),
        onTap: () {
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
                      onPressed: () async {
                       // update note in db
                        Navigator.pop(context);
                      },
                      child: Text('update'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
