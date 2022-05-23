import 'package:flutter/material.dart';
import 'package:week3/model/catmodel.dart';
import 'package:week3/ui/catlisting.dart';

import 'catdetails.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({Key? key}) : super(key: key);

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  static const int tabletBreakpoint = 600;
  CatModel? _selectedCat;

  Widget _buildMobileLayout() {
    return CatListing(catSelectedCallback: (cat) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return CatDetails(
          isInTabletLayout: false,
          cat: cat,
        );
      }));
    });
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 16.0,
            child: CatListing(
              catSelectedCallback: (cat) {
                setState(() {
                  _selectedCat = cat;
                });
              },
              selectedCat: _selectedCat,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: CatDetails(
            isInTabletLayout: true,
            cat: _selectedCat,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isInTabletLayout =
        MediaQuery.of(context).size.shortestSide >= tabletBreakpoint;
    return isInTabletLayout ? _buildTabletLayout() : _buildMobileLayout();
  }
}
