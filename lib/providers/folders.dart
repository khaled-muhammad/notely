import 'package:flutter/foundation.dart';
import 'package:notely/models/folder.dart';

final List<Folder> _items = [];

class Folders with ChangeNotifier {
  void add(Folder album) {
    _items.add(album);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void modify(int index, Folder newVersion) {
    _items[index] = newVersion;
    notifyListeners();
  }

  List<Folder> get getItems {
    return <Folder>[..._items];
  }
}