import 'dart:math';
import 'package:flutter/material.dart';
import 'package:week3/model/catmodel.dart';

class CatDetails extends StatefulWidget {
  final CatModel? cat;
  final bool isInTabletLayout;
  const CatDetails({Key? key, this.cat, required this.isInTabletLayout})
      : super(key: key);

  @override
  State<CatDetails> createState() => _CatDetailsState();
}

class _CatDetailsState extends State<CatDetails> {
  @override
  Widget build(BuildContext context) {
    if (widget.cat == null) {
      return const Center(
        child: Text('No cat selected'),
      );
    } else {
      final Widget content =
          ListView(controller: ScrollController(), children: _buildDetails());
      if (widget.isInTabletLayout) {
        return Center(child: content);
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.cat?.breed ?? 'Unknown'),
        ),
        body: Center(child: content),
      );
    }
  }

  int getRandomStatusCode() {
    var statuscodes = [
      100,
      101,
      102,
      200,
      201,
      202,
      203,
      204,
      206,
      207,
      300,
      301,
      302,
      303,
      304,
      305,
      307,
      308,
      400,
      401,
      402,
      403,
      404,
      405,
      406,
      407,
      408,
      409,
      410,
      411,
      412,
      413,
      414,
      415,
      416,
      417,
      418,
      420,
      421,
      422,
      423,
      424,
      426,
      429,
      431,
      444,
      450,
      451,
      497,
      498,
      499,
      500,
      501,
      502,
      503,
      504,
      506,
      507,
      508,
      509,
      510,
      511,
      521,
      523,
      525,
      599
    ];
    var random = Random();
    return statuscodes[random.nextInt(statuscodes.length)];
  }

  List<Widget> _buildDetails() {
    var details = <Widget>[
      ListTile(
        title: const Text('Country'),
        subtitle: Text(widget.cat?.country.toString() ?? 'Unknown'),
      ),
      ListTile(
        title: const Text('Origin'),
        subtitle: Text(widget.cat?.origin ?? 'Unknown'),
      ),
      ListTile(
        title: const Text('Coat'),
        subtitle: Text(widget.cat?.coat ?? 'Unknown'),
      ),
      ListTile(
        title: const Text('Pattern'),
        subtitle: Text(widget.cat?.pattern ?? 'Unknown'),
      ),
    ];
    if (widget.isInTabletLayout) {
      details.add(Image.network(
        'https://http.cat/${getRandomStatusCode()}',
        fit: BoxFit.cover,
      ));
    }
    return details;
  }
}
