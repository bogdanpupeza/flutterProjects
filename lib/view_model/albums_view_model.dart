import 'package:flutter/material.dart';
import '../model/albums.dart';
import '../model/albums_repository.dart';

const String API = "https://jsonplaceholder.typicode.com/albums";

class AlbumsViewModel with ChangeNotifier {
  dynamic _albums;
  DateTime _dateTime = DateTime.now();
  dynamic get albums {
    return _albums;
  }
  DateTime get date{
    return _dateTime;
  }
  
  Future<void> fetchAlbumData() async {
    try {
      
      List<Album> albumList = await AlbumsRepository().fetchAlbumsList();
      _albums = albumList;
    } catch(error) {
      print(error);
    }
    notifyListeners();
  }
}