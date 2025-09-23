import 'package:dailytask_app/ui/utils/app_colors.dart';
import 'package:dailytask_app/ui/utils/text_style.dart';
import 'package:dailytask_app/ui/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDialog extends StatelessWidget {
  final TextEditingController controller;
  final bool isEdit;
  final VoidCallback onConfirm;

  const TaskDialog({
    super.key,
    required this.controller,
    required this.isEdit,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        isEdit ? "Edit Task" : "Add Task",
        textAlign: TextAlign.center,
      ),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Enter task",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        /// Cancel Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MycustomButton(
              backgroundColor: Colors.grey.shade300,
              height: 40.h,
              width: 100.w,
              title: "Cancel",
              titleTextStyle: AppTextStyles.popBoldbt14.copyWith(
                color: Colors.black, // Sirf color change karega
              ),
              // textColor: AppColors.blackColor,
              onPressed: () => Get.back(),
            ),

            /// Confirm Button (Add / Update)
            MycustomButton(
              backgroundColor: AppColors.greeycolor,
              height: 40.h,
              width: 100.w,
              title: isEdit ? "Update" : "Add",
              // textColor: AppColors.whiteColor,
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  onConfirm();
                  Get.back();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
