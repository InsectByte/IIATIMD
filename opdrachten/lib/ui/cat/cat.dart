import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class Cat extends StatefulWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  final LocalStorage storage = LocalStorage('cat');

  String _catFact = '';

  @override
  @mustCallSuper
  @protected
  void initState() {
    super.initState();

    storage.ready.then((_) {
      if (storage.getItem('catFact') == null) {
        _getNewCatFact();
      } else {
        setState(() {
          _catFact = storage.getItem('catFact');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(_catFact),
            ),
            Center(
              child: TextButton.icon(
                  onPressed: _getNewCatFact,
                  icon: const Icon(Icons.wb_sunny),
                  label: const Text("New Fact")),
            )
          ],
        ),
      ),
    );
  }

  // Make a GET Request to https://www.catfact.ninja/fact
  // and display the fact in the Text widget
  // Hint: https://pub.dev/packages/http
  void _getNewCatFact() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
    if (response.statusCode == 200) {
      setState(() {
        var body = json.decode(response.body);
        _catFact = body['fact'];
        // Save new Fact to phone
        // Hint: https://pub.dev/packages/shared_preferences
        storage.setItem('catFact', _catFact);
      });
    } else {
      throw Exception('Failed to load cat fact');
    }
  }
}
