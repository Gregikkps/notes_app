import 'package:flutter/material.dart';
import 'package:notes_app/database/database_helper.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
