import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function openSideBar;

  const Home({Key key, this.openSideBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        // leading: GestureDetector(
        //     onTap: openSideBar, child: Icon(Icons.menu_rounded)),
      ),
    );
  }
}
