import 'package:dailytask_app/models/task_model.dart';
import 'package:dailytask_app/services/todo_services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final TodoService _todoService = TodoService();

  var todos = <TaskModel>[].obs;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    todos.assignAll(_todoService.getTasks());
  }

  /// Add Task
  void addTask(String title) {
    if (title.isNotEmpty) {
      _todoService.addTask(TaskModel(title: title));
      todos.assignAll(_todoService.getTasks());
      textController.clear(); // input clear after add
    }
  }

  /// Update Task
  void updateTask(int index, String newTitle) {
    if (newTitle.isNotEmpty) {
      _todoService.updateTask(index, newTitle);
      todos.assignAll(_todoService.getTasks());
    }
  }

  /// Toggle completed
  void toggleTask(int index) {
    _todoService.toggleTask(index);
    todos.assignAll(_todoService.getTasks());
  }

  /// Remove Task
  void removeTask(int index) {
    _todoService.removeTask(index);
    todos.assignAll(_todoService.getTasks());
  }

  /// Clear All Tasks
  void clearTasks() {
    _todoService.clearTasks();
    todos.assignAll(_todoService.getTasks());
  }
}
