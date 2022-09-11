import 'package:flutter/material.dart';

enum SaveButtonState {
  loading,
  success,
  error,
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.state, this.onPressed});

  final SaveButtonState state;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (state == SaveButtonState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return TextButton(
      onPressed: onPressed,
      child: const Text("Save"),
    );
  }
}
