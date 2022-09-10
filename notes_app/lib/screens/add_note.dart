import 'package:flutter/material.dart';
import 'package:notes_app/components/state_button.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add note"),
        actions: const [
          StateButton(),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: contentController,
            minLines: 3,
            maxLines: 100,
          ),
        ],
      ),
    );
  }
}
