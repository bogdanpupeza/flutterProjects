import '../model/albums_service.dart';
import './albums.dart';

class AlbumsRepository{
  AlbumsService _albumsService = AlbumsService();

  Future <List<Album>> fetchAlbumsList() async {
    dynamic response = await _albumsService.getResponse();
    final jsonData = response as List;
    //jsonData.toString());
    List<Album> albumList = jsonData.map((element) => Album.fromJson(element)).toList();
    return albumList;
  }
}