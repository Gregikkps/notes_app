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

  SaveButtonState saveButtonState = SaveButtonState.idle;

  void setButtonState(SaveButtonState state) {
    setState(() {
      saveButtonState = state;
    });
  }

  void submit() async {
    setButtonState(SaveButtonState.loading);

    try {
      note = await NotesService.create(contentController.text);

      setButtonState(SaveButtonState.success);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context, note);
      });
    } catch (e) {
      setButtonState(SaveButtonState.error);
    }
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
              maxLines: 100,
            ),
          ],
        ),
      ),
    );
  }
}
