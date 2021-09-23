import 'package:flutter/material.dart';
import 'package:yellowbooks/Pages/Pages.dart';
import 'package:yellowbooks/Pages/SideBar.dart';
import 'package:provider/provider.dart';

class YellowBooks extends StatefulWidget {
  @override
  _YellowBooksState createState() => _YellowBooksState();
}

class _YellowBooksState extends State<YellowBooks>
    with SingleTickerProviderStateMixin {
  final Duration _duration = Duration(milliseconds: 300);

  static AnimationController anime;

  String _currentPageName;
  bool _isSideBarOpen = false;

  @override
  void initState() {
    anime = AnimationController(vsync: this, duration: _duration);

    super.initState();
  }

  @override
  void dispose() {
    anime.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _changePage(String name) {
      setState(() {
        anime.reverse();

        _currentPageName = name;

        _isSideBarOpen = false;
      });
    }

    void _openSideBar() {
      setState(() {
        anime.forward();
        _isSideBarOpen = true;
      });
    }

    void _closeSideBar() {
      setState(() {
        anime.forward();
        _isSideBarOpen = false;
      });
    }

    void _toggleSideBar() {
      setState(() {
        if (_isSideBarOpen) {
          anime.reverse();
          _isSideBarOpen = false;
        } else {
          anime.forward();
          _isSideBarOpen = true;
        }
      });
    }

    return WillPopScope(
        onWillPop: () async {
          _toggleSideBar();
          return false;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              SideBar(
                  duration: _duration,
                  changePage: _changePage,
                  currentPageName: _currentPageName),
              Pages(
                duration: _duration,
                anime: anime,
                name: _currentPageName,
                closeSideBar: _closeSideBar,
                openSideBar: _openSideBar,
                toggleSideBar: _toggleSideBar,
                isSideBarOpen: _isSideBarOpen,
              )
            ])));
  }
}
