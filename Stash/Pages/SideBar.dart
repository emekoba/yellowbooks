import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatefulWidget {
  SideBar(
      {this.duration,
      this.changePage,
      this.slideLeft,
      this.slideUp,
      this.currentPageName,
      this.openSearch});

  final Duration duration;
  final Function changePage;
  final Function openSearch;
  final Animation<Offset> slideLeft;
  final Animation<Offset> slideUp;
  final String currentPageName;

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Map<String, IconData> btnList = {
    "home": Icons.home_outlined,
    "services": FontAwesomeIcons.wrench,
    // "library": Icons.bookmark_rounded,
    // "dictionary": FontAwesomeIcons.book,
    // "workstation": Icons.edit_outlined,
    // "lectures": Icons.laptop_mac_rounded,
    // "forums": Icons.web,
    // "ask an expert": Icons.face_rounded,
    // "store": Icons.store
  };

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontWeight: FontWeight.bold, fontSize: 10);

    void _logout() {
      showDialog<Widget>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text("Sign Out ?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15, color: Colors.redAccent)),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);

                          // mainBloc.logoutUser();
                        },
                        child: Text("yes",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).buttonColor))),
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("no",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).buttonColor)))
                  ]));
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            heroTag: null,
            mini: true,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.close_rounded),
            onPressed: () => Navigator.pop(context)),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: Colors.yellowAccent,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                      child: CircleAvatar(
                          minRadius: 30,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: AssetImage(
                              "lib/Resources/Profile/Profile7.jpg")))),
              SizedBox(height: 30),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: btnList.entries
                              .map((e) => SideBarBtn(
                                  name: e.key,
                                  changePage: widget.changePage,
                                  currentPageName: widget.currentPageName,
                                  icon: e.value))
                              .toList()))),
            ]));
  }
}

class SideBarBtn extends StatelessWidget {
  const SideBarBtn(
      {this.name, this.changePage, this.currentPageName, this.icon});

  final String name;
  final Function changePage;
  final String currentPageName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => changePage(name),
        child: Container(
            height: 55,
            child: Row(children: [
              SizedBox(width: 30),
              Text(name.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 12)),
              Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Icon(icon,
                      color: Theme.of(context).iconTheme.color,
                      size: name == "services" ? 15 : 20)),
            ])));
  }
}
