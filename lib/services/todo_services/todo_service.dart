import 'package:planit/models/task_model.dart';

class TodoService {
  // Temporary local list
  final List<TaskModel> _tasks = [];

  /// Get all tasks
  List<TaskModel> getTasks() {
    return _tasks;
  }

  /// Add task
  void addTask(TaskModel task) {
    _tasks.add(task);
  }

  /// Update task
  void updateTask(int index, String newTitle) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].title = newTitle;
    }
  }

  /// Toggle task complete/incomplete
  void toggleTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    }
  }

  /// Remove task
  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
    }
  }

  /// Clear all tasks
  void clearTasks() {
    _tasks.clear();
  }
}
