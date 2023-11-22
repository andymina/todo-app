import 'package:flutter/material.dart';

class TodoDialog extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  TodoDialog(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 120,
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    hintText: hintText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: onSave, child: Text('Save')),
                  SizedBox(width: 5),
                  ElevatedButton(onPressed: onCancel, child: Text('Cancel'))
                ],
              ),
            ],
          ),
        ));
  }
}
