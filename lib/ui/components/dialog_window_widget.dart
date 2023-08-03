import 'package:flutter/material.dart';
import '../app_navigator/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_style.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/notes_provider.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget(
      {super.key,
      required this.index,
      required this.title,
      required this.text});

  final int index;
  final String title, text;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: AppStyle.fontStyle
                .copyWith(fontSize: 14, color: AppColors.mediumGrey),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.lightPurpleColor),
            onPressed: () {
              model.setControllers(index);
              Navigator.popAndPushNamed(context, AppRoutes.changeNotes,
                  arguments: index,);
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.purpleColor,
            ),
            label: Text(
              'Редактировать',
              style: AppStyle.fontStyle
                  .copyWith(fontSize: 16, color: AppColors.purpleColor),
            ),
          ),
          DeleteNoteWidget(index: index),
        ],
      ),
    );
  }
}

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return TextButton.icon(
      style: TextButton.styleFrom(backgroundColor: AppColors.lightRedColor),
      onPressed: () {
        model.deleteNotes(context, index);
      },
      icon: const Icon(
        Icons.backspace,
        color: AppColors.redColor,
      ),
      label: Text(
        'Удалить',
        style: AppStyle.fontStyle
            .copyWith(fontSize: 16, color: AppColors.redColor),
      ),
    );
  }
}
