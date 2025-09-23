import 'package:dailytask_app/dialogs/task_dialog.dart';
import 'package:dailytask_app/models/task_model.dart';
import 'package:dailytask_app/ui/todo/todo_controller.dart';
import 'package:dailytask_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greeycolor,
        centerTitle: true,
        title: Text('To~Do', style: TextStyle(color: AppColors.whiteColor)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        child: Obx(() {
          if (controller.todos.isEmpty) {
            return const Center(child: Text("No tasks added yet."));
          }

          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              TaskModel task = controller.todos[index];

              return Card(
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    activeColor: AppColors.redColor,
                    checkColor: Colors.white,
                    onChanged: (_) => controller.toggleTask(index),
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Edit button
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          final editController = TextEditingController(
                            text: task.title,
                          );
                          Get.dialog(
                            TaskDialog(
                              controller: editController,
                              isEdit: true,
                              onConfirm: () {
                                controller.updateTask(
                                  index,
                                  editController.text,
                                );
                              },
                            ),
                          );
                        },
                      ),

                      /// Delete button
                      IconButton(
                        icon: Icon(Icons.delete, color: AppColors.redColor),
                        onPressed: () => controller.removeTask(index),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),

      /// Floating Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greeycolor,
        onPressed: () {
          final addController = TextEditingController();
          Get.dialog(
            TaskDialog(
              controller: addController,
              isEdit: false,
              onConfirm: () {
                controller.addTask(addController.text);
              },
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
