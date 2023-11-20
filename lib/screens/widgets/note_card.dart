import 'package:flutter/material.dart';
import 'package:flutter_note_me/screens/note_view.dart';

import '../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.onNoteDeleted});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(note: note, index: index, onNoteDeleted: onNoteDeleted,)));
      },
      child: Card(
        color: const Color(0xFF81C784),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  note.note,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ]
          ),
        ),
      ),
    );
  }
}
