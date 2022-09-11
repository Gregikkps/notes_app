import 'package:flutter/material.dart';
import 'package:notes_app/components/state_button.dart';
import 'package:notes_app/data/notes/note_model.dart';
import 'package:notes_app/data/notes/notes_service.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final contentController = TextEditingController();
  Note? note;

  SaveButtonState saveButtonState = SaveButtonState.success;

  void setButtonState(SaveButtonState state) {
    setState(() {
      saveButtonState = state;
    });
  }

  void submit() async {
    setButtonState(SaveButtonState.loading);

    Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        note = await NotesService.create(contentController.text);

        // Use this line to create note with mocked error
        // note = await NotesService.createWithError(contentController.text);

        Future.delayed(const Duration(milliseconds: 1000), () {
          setButtonState(SaveButtonState.success);
          Navigator.pop(context, note);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Ups, somenthing went wrong."),
          ),
        );
        setButtonState(SaveButtonState.error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, note);
        return true;
      },
      child: Scaffold(
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
              maxLines: 20,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type your note here.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
