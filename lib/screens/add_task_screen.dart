import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AddTaskScreen extends StatefulWidget {
  final String? docId;
  final String? existingTitle;

  const AddTaskScreen({super.key, this.docId, this.existingTitle});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    if (widget.existingTitle != null) {
      taskController.text = widget.existingTitle!;
    }
  }

  void saveTask() {
    final title = taskController.text.trim();
    if (title.isEmpty) return;

    if (widget.docId == null) {
      firestoreService.addTask(title);
    } else {
      firestoreService.updateTask(widget.docId!, title);
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
              controller: taskController,
              decoration: const InputDecoration(labelText: 'Task Title'),
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
