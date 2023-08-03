import 'package:flutter/material.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/hive/notes_data.dart';

class NotesProvider extends ChangeNotifier {
  // controllers
  final titleController = TextEditingController();
  final textController = TextEditingController();

  // add note

  Future<void> onAddNotes() async {
    await HiveBoxes.notes
        .add(NotesData(
          title: titleController.text.isNotEmpty
              ? titleController.text
              : 'Заметка',
          text: textController.text.isNotEmpty
              ? textController.text
              : 'Текст заметки',
        ))
        .then((value) => controllerClear());
  }

  Future<void> controllerClear() async {
    titleController.clear();
    textController.clear();
  }

  // delete note
  Future<void> deleteNotes(BuildContext context, int index) async {
    await HiveBoxes.notes
        .deleteAt(index)
        .then((value) => Navigator.pop(context));
  }

  // change note

  Future<void> changeNote(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
            index,
            NotesData(
                title: titleController.text.isNotEmpty
                    ? titleController.text
                    : 'Заметка',
                text: textController.text.isNotEmpty
                    ? textController.text
                    : 'Текст заметки'))
        .then((value) => Navigator.pop(context));
  }

  // set textfield
  Future<void> setControllers(int index) async {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? '';
    textController.text = HiveBoxes.notes.getAt(index)?.text ?? '';

  }
}
