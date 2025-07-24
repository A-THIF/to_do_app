// lib/screens/add_task_screen.dart

import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AddTaskScreen extends StatefulWidget {
  final String? docId;
  final String? existingTitle;
  final String? existingDescription;

  const AddTaskScreen({
    super.key,
    this.docId,
    this.existingTitle,
    this.existingDescription,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    if (widget.existingTitle != null) {
      titleController.text = widget.existingTitle!;
    }
    if (widget.existingDescription != null) {
      descriptionController.text = widget.existingDescription!;
    }
  }

  void saveTask() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    if (title.isEmpty) return;

    if (widget.docId == null) {
      firestoreService.addTask(title, description);
    } else {
      firestoreService.updateTask(widget.docId!, title, description);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.docId == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Task Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveTask,
              child: Text(widget.docId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
