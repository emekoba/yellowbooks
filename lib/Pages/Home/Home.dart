import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _hint = "Home";

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    void _toggleHint(open) {
      setState(() {
        if (open) {
          _hint = "";
        } else {
          _hint = "Home";
        }
      });
    }

    Widget _getFloatingSearchBar() {
      return FloatingSearchBar(
          backgroundColor: Theme.of(context).accentColor,
          accentColor: Colors.black,
          margins: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          hint: _hint,
          hintStyle:
              Theme.of(context).textTheme.headline6.copyWith(fontSize: 15),
          queryStyle:
              Theme.of(context).textTheme.headline6.copyWith(fontSize: 15),
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          maxWidth: isPortrait ? 600 : 500,
          onFocusChanged: (open) => _toggleHint(open),
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            // Call your model, bloc, controller here.
          },
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
                showIfOpened: false,
                child: Icon(Icons.search_rounded,
                    color: Theme.of(context).iconTheme.color, size: 20))
          ],
          builder: (context, transition) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: Colors.accents.map((color) {
                        return Container(height: 112, color: color);
                      }).toList()))));
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
            fit: StackFit.expand,
            children: [Scaffold(), _getFloatingSearchBar()]));
  }
}



  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //           // elevation: 0,
  //           backgroundColor: Theme.of(context).accentColor,
  //           title: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
  // Icon(Icons.home_outlined,
  //     color: Theme.of(context).iconTheme.color, size: 20),
  //             SizedBox(width: 10),
  //             Text("Home",
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .headline6
  //                     .copyWith(fontSize: 15))
  //           ])));
  // }
