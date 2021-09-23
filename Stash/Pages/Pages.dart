import 'package:flutter/material.dart';
import 'package:yellowbooks/Pages/Home/Home.dart';
import 'package:yellowbooks/Pages/SideBar.dart';

class Pages extends StatefulWidget {
  Pages({
    this.isSideBarOpen,
    this.duration,
    this.anime,
    this.name,
    this.closeSideBar,
    this.openSideBar,
    this.toggleSideBar,
  });

  final bool isSideBarOpen;
  final Duration duration;
  final AnimationController anime;
  final String name;
  final Function closeSideBar;
  final Function openSideBar;
  final Function toggleSideBar;

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  String _pageEntered = "dashboard";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double _left = widget.isSideBarOpen ? 0.30 * width : 0;

    double _right = widget.isSideBarOpen ? -0.4 * width : 0;

    Widget _getPage() {
      if (_pageEntered != widget.name) {
        // mainBloc.onPageEntered(pageName: widget.name);

        setState(() => _pageEntered = widget.name);
      }

      switch (widget.name) {
        //   case "dashboard":
        //     return Dashboard(openSidebar: _openSidebar);
        //     break;
        //   case "laws and docs":
        //     return LawsAndDocs(openSidebar: _openSidebar);
        //     break;
        //   case "library":
        //     return Library(openSidebar: _openSidebar);
        //     break;
        //   case "dictionary":
        //     return Dictionary(openSidebar: _openSidebar);
        //     break;
        //   case "lectures":
        //     return Lectures(openSidebar: _openSidebar);
        //     break;
        //   case "workstation":
        //     return WorkStation(openSidebar: _openSidebar);
        //     break;
        //   case "ask an expert":
        //     return AskAnExpert(openSidebar: _openSidebar);
        //     break;
        //   case "forums":
        //     return Forums(openSidebar: _openSidebar);
        //     break;
        //   case "store":
        //     return Store(openSidebar: _openSidebar);
        //     break;
        //   case "notifications":
        //     return Notifications(openSidebar: _openSidebar);
        //     break;
        //   case "settings":
        //     return Settings(openSidebar: _openSidebar);
        //     break;
      }

      return Home(openSideBar: widget.openSideBar);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.menu_rounded),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<Widget>(builder: (context) {
              return SideBar();
            }));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Home(),
    );

    // AnimatedPositioned(
    //     top: 0,
    //     bottom: 0,
    //     left: _left,
    //     right: _right,
    //     duration: widget.duration,
    //     child: Material(
    //         // animationDuration: widget.duration,
    //         elevation: 20,
    //         color: Theme.of(context).primaryColor,
    //         borderRadius: BorderRadius.circular(widget.isSideBarOpen ? 20 : 0),
    //         child: Stack(children: [
    //           _getPage(),
    //           Container(
    //               height: widget.isSideBarOpen ? double.infinity : 0,
    //               child: GestureDetector(onTap: () => widget.closeSideBar()))
    //         ])));
  }
}
