import './note.dart';

class Folder {
  final int id;
  final String name;
  final List<Note> notes;

  Folder({required this.id, required this.name, required this.notes});
}