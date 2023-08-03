import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../../domain/hive/hive_box.dart';
import '../../domain/hive/notes_data.dart';
import '../../domain/providers/notes_provider.dart';
import 'card_widget.dart';
import 'dialog_window_widget.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return LayoutWidget(
          allNotes: allNotes,
        );
      },
    );
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key, required this.allNotes});

  final List<NotesData> allNotes;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 425) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              mainAxisExtent: 195),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  constraints: const BoxConstraints(
                      maxHeight: 200, maxWidth: double.infinity, minWidth: 380),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (context) {
                    return DialogWindowWidget(
                      index: index,
                      title: allNotes[index].title,
                      text: allNotes[index].text,
                    );
                  },
                );
              },
              child: CardWidget(
                index: index,
                title: allNotes[index].title,
                text: allNotes[index].text,
                date: allNotes[index].date,
              ),
            );
          },
          itemCount: allNotes.length,
        );
      } else {
        return ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                model.setControllers;
                showModalBottomSheet(
                  constraints: const BoxConstraints(
                      maxHeight: 200, maxWidth: double.infinity, minWidth: 380),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (context) {
                    return DialogWindowWidget(
                      index: index,
                      title: allNotes[index].title,
                      text: allNotes[index].text,
                    );
                  },
                );
              },
              child: CardWidget(
                index: index,
                title: allNotes[index].title,
                text: allNotes[index].text,
                date: allNotes[index].date,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: allNotes.length,
        );
      }
    });
  }
}
