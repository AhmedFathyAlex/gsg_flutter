import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key,this.onDismissed, required this.note});

  final void Function(DismissDirection)? onDismissed;
  final NoteModel note;

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
      ),
    );
  }
}