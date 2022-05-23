import 'package:flutter/material.dart';
import 'package:week3/ui/fact.dart';
import 'package:week3/ui/master_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cat App'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'Cat'),
            Tab(text: 'Fact'),
          ]),
        ),
        body: const TabBarView(children: [
          Center(
            child: MasterScreen(),
          ),
          Center(
            child: Fact(),
          ),
        ]),
      ),
    ));
  }
}
