import 'package:flutter/material.dart';
import 'package:yellowbooks/Pages/Pages.dart';
import 'package:provider/provider.dart';

class YellowBooks extends StatefulWidget {
  @override
  _YellowBooksState createState() => _YellowBooksState();
}

class _YellowBooksState extends State<YellowBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: Pages());
  }
}
