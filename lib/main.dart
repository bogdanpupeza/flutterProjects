import 'package:flutter/material.dart';
import './view_model/albums_view_model.dart';
import 'package:provider/provider.dart';
import './view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AlbumsViewModel(),
        ),
      ],
      child: MaterialApp(
        title: "My Albums",
        initialRoute: "/",
        routes: {
          "/": (context) => HomeScreen(),
        },
      ),
    );
  }
}
