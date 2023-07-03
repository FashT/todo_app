import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'HomePage.dart';


void main() async{

await Hive.initFlutter();


var box = await  Hive.openBox('mybox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Hompage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(color: Colors.yellowAccent),
      ),
    
    );
  }
}
