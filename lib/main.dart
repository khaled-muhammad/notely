import 'package:flutter/material.dart';
import 'package:notely/providers/folders.dart';
import 'package:notely/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notely',
      theme: ThemeData.from(colorScheme: ColorScheme.dark(
        background: Color.fromRGBO(29, 27, 39, 1),
        //primaryColor: Color.fromRGBO(83, 101, 222, 1),
      )),
      routes: {
        "/": (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider<Folders>(create: (ctx) => Folders()),
          ],
          child: Home(),
        )
      },
    );
  }
}