import 'package:hive_flutter/hive_flutter.dart';
import 'notes_data.dart';

abstract class HiveBoxes {
  static final Box<NotesData> notes = Hive.box<NotesData>('notes');
}
