import 'package:flutter/material.dart';
import 'package:flutter_note_me/screens/create_note.dart';
import 'package:flutter_note_me/screens/widgets/note_card.dart';

import '../models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF81C784),
        title: const Text("Note Me", style: TextStyle(
          color: Colors.white
        )),
      ),
      body: Container(
        width: double.infinity, // Ensures the container fills the width
        height: double.infinity, // Ensures the container fills the height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: notes.isEmpty
            ? const Center(
          child: Text(
            'No notes available.',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        )
            : ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index){
            return NoteCard(note: notes[index], index: index, onNoteDeleted: onNoteDeleted);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF81C784),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNote(onNewNoteCreated: onNewNoteCreated,)));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void onNewNoteCreated(Note note){
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index){
    notes.removeAt(index);
    setState(() {});
  }
}
