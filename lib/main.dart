import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tictoc_app/provider/game_provider.dart';
import 'package:tictoc_app/screens/home.dart';

Color pink = Color(0xfff9ccc4);
Color brown = Color(0xff845c54);
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GameProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.spaceMonoTextTheme()),
      home: Home(),
    );
  }
}
