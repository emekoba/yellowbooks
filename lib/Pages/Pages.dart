import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellowbooks/MainBloc.dart';
import 'package:yellowbooks/Pages/Directories/Directories.dart';
import 'package:yellowbooks/Pages/Home/Home.dart';
import 'package:yellowbooks/Pages/SideBar.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:yellowbooks/Widgets/Dumb/ErrorPage.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    Widget _getPage() {
      switch (mainBloc.currentPage) {
        case "home":
          return Home();
          break;

        case "directories":
          return Directories();
          break;

        default:
          return ErrorPage(
              message:
                  "This page does not exist...please check Pages.dart file");
          break;
      }
    }

    void _openSideBar() {
      Navigator.of(context).push(PageTransition(
          type: PageTransitionType.rippleLeftUp, child: SideBar()));
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            heroTag: null,
            mini: true,
            child: Icon(Icons.menu_rounded),
            onPressed: _openSideBar),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: _getPage());
  }
}
