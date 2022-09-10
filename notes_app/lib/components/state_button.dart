import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {
  const StateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() {}),
      child: const Text('Save'),
    );
  }
}
