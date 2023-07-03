import 'package:flutter/material.dart';
import 'package:todo_app/show_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback buttonSaved;
  VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.controller,
    required this.buttonSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellowAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShowButton(
                  'Save',
                  buttonSaved,
                ),
                const SizedBox(
                  width: 8,
                ),
                ShowButton(
                  'Clear',
                  onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
