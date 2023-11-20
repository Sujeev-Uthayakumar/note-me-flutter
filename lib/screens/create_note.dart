import 'package:flutter/material.dart';
import 'package:flutter_note_me/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF81C784),
        title: const Text("New Note", style: TextStyle(
            color: Colors.white
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                  fontSize: 28
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: noteController,
              style: const TextStyle(
                fontSize: 18
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note"
              ),
            )
          ],
        ),
      ),

        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF81C784),
            onPressed: (){
            // Check if either the title or the note is empty
            if(titleController.text.isEmpty || noteController.text.isEmpty){
              // Use a SnackBar to show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Both title and note must be filled in to save.'),
                  duration: Duration(seconds: 2),
                ),
              );
              return; // Exit the onPressed callback, preventing the note from being saved
            }



            final note = Note(
              title: titleController.text,
              note: noteController.text,
            );

            widget.onNewNoteCreated(note);
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.save, color: Colors.white)
        ),
    );
  }
}
