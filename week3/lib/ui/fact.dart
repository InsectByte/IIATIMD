import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fact extends StatefulWidget {
  const Fact({Key? key}) : super(key: key);

  @override
  State<Fact> createState() => _FactState();
}

class _FactState extends State<Fact> {
  String _fact = '';

  @override
  void initState() {
    super.initState();
    getCatFact();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_fact),
          TextButton.icon(
            icon: const Icon(Icons.lightbulb),
            onPressed: getCatFact,
            label: const Text('Get Fact'),
          ),
        ],
      ),
    );
  }

  // Get catFact from https://catfact.ninja/fact
  void getCatFact() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      setState(() {
        _fact = body['fact'];
      });
    } else {
      throw Exception('Failed to load catFact');
    }
  }
}
