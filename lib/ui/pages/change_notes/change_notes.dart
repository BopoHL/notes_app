import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/notes_provider.dart';
import '../../components/text_field_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_style.dart';

class ChangeNotes extends StatelessWidget {
  const ChangeNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Изменить заметку',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.blackColor,
        ),
      ),
      body: const ChangeBody(),
    );
  }
}

class ChangeBody extends StatelessWidget {
  const ChangeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg : 0;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFieldWidget(
            labelText: 'Заголовок',
            hintText: 'Заголовок',
            textEditingController: model.titleController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            labelText: 'Заметка',
            hintText: 'Заметка',
            textEditingController: model.textController,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                heroTag: 'change-btn',
                elevation: 0,
                onPressed: () {
                  model.changeNote(context, index);
                },
                label: Text(
                  'Изменить',
                  style: AppStyle.fontStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.purpleColor),
                )),
          )
        ],
      ),
    );
  }
}
