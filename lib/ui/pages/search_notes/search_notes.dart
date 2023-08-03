import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/hive/hive_box.dart';
import '../../components/card_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_style.dart';
import '../../../domain/hive/notes_data.dart';

class SearchNotes extends StatefulWidget {
  const SearchNotes({super.key});

  @override
  State<SearchNotes> createState() => _SearchNotesState();
}

class _SearchNotesState extends State<SearchNotes> {
  final searchController = TextEditingController();
  final _notes = HiveBoxes.notes.values.toList();
  var filteredNotes = <NotesData>[];

  void _searchNotes() async {
    final query = searchController.text;

    if (query.isNotEmpty) {
      filteredNotes = _notes.where((NotesData noteList) {
        return noteList.title.toLowerCase().contains(query.toLowerCase()) ||
            noteList.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredNotes = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.blackColor,
          style: AppStyle.fontStyle,
          decoration: const InputDecoration(
              hintText: 'Поиск...',
              hintStyle: AppStyle.fontStyle,
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final note = filteredNotes[index];
              return CardWidget(
                index: index,
                title: note.title,
                date: note.date,
                text: note.text,
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 16,
                )),
            itemCount: filteredNotes.length,
          );
        },
      ),
    );
  }
}
