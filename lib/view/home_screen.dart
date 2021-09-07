import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_albums_2/view_model/albums_view_model.dart';
import 'package:provider/provider.dart';

import './album_widget.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void>_fetchAlbumsData(BuildContext context) async {
    await Provider.of<AlbumsViewModel>(context, listen: false).fetchAlbumData();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AlbumsViewModel>(context);
    var dateTime = provider.date;
    dynamic albums = provider.albums;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Albums"),
      ),
      body: FutureBuilder(
        future: _fetchAlbumsData(context),
        builder: (ctx, snapshot) =>
         RefreshIndicator(
          onRefresh: () => _fetchAlbumsData(context),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: 
                  dateTime == DateTime.now() 
                  ? Text(
                    "Results updated just now",
                    style: TextStyle(fontSize: 20),
                  )
                  : Text(
                    "Results updated ${DateFormat().formatDuration(dateTime)}.",
                    style: TextStyle(fontSize: 20),
                  )
                  
                ),
                if(albums != null)
                  Container(
                    height: 600,
                    child: ListView.builder(
                      
                      itemCount: albums.length,
                      itemBuilder: (ctx, index) {
                        return AlbumWidget(
                          name: albums[index].name,
                          id: albums[index].id,
                          userId: albums[index].userId,
                        );
                      },
                    ),
                  ),
              ],
            ),
        ),
      ),
    );
  }
}