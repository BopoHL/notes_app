import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/notes_provider.dart';
import '../../components/text_field_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_style.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Добавить заметку',
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
      body: const AddNotesBody(),
    );
  }
}

class AddNotesBody extends StatelessWidget {
  const AddNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
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
                heroTag: 'add-btn',
                elevation: 0,
                onPressed: () {
                  model.onAddNotes();
                  Navigator.pop(context);
                },
                label: Text(
                  'Добавить',
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
