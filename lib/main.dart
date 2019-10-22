import 'package:flutter/material.dart';
import 'package:flutter_starbucks2/repository/starbucks_repository.dart';
import 'package:flutter_starbucks2/root_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      Provider<StarbucksRepository>.value(value: StarbucksRepository()),
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}

