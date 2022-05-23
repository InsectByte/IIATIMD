import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week3/model/catmodel.dart';
import 'package:http/http.dart' as http;

class CatListing extends StatefulWidget {
  final ValueChanged<CatModel> catSelectedCallback;
  final CatModel? selectedCat;
  const CatListing(
      {Key? key, required this.catSelectedCallback, this.selectedCat})
      : super(key: key);

  @override
  State<CatListing> createState() => _CatListingState();
}

class _CatListingState extends State<CatListing> {
  List<CatModel> _availableCats = [];

  @override
  void initState() {
    super.initState();
    _getBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _availableCats.map((CatModel cat) {
        return ListTile(
          onTap: () {
            widget.catSelectedCallback(cat);
          },
          selected: widget.selectedCat == cat,
          title: Text(cat.breed),
          subtitle: Text(cat.origin),
        );
      }).toList(),
    );
  }

  void _getBreeds() {
    var url = 'https://catfact.ninja/breeds';
    http.get(Uri.parse(url)).then((response) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      setState(() {
        _availableCats = jsonResponse.map((dynamic item) {
          return CatModel.fromJson(item);
        }).toList();
      });
    });
  }
}
