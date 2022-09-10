import 'package:flutter/material.dart';
import 'package:notes_app/components/state_button.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final contentController = TextEditingController();

  SaveButtonState saveButtonState = SaveButtonState.idle;

  void setButtonState(SaveButtonState state) {
    setState(() {
      saveButtonState = state;
    });
  }

  void submit() {
    setButtonState(SaveButtonState.loading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add note"),
        actions: [
          SaveButton(
            state: saveButtonState,
            onPressed: () {
              submit();
            },
          ),
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
