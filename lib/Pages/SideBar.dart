import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yellowbooks/MainBloc.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Map<String, IconData> btnList = {
    "home": FontAwesomeIcons.home,
    "directories": FontAwesomeIcons.bookOpen,
  };

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    bool darkModeOn =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    TextStyle _textStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontWeight: FontWeight.bold, fontSize: 10);

    void _changePage(String name) {
      Navigator.pop(context);

      mainBloc.changePage(newPage: name);
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            heroTag: null,
            mini: true,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.close_rounded,
                color:
                    // darkModeOn ? Theme.of(context).accentColor :
                    Colors.black),
            onPressed: () => Navigator.pop(context)),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: Theme.of(context).accentColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.only(top: 60, left: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: FittedBox(
                  child: CircleAvatar(
                      minRadius: 30,
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                          AssetImage("lib/Resources/Profile/Profile7.jpg")))),
          SizedBox(height: 30),
          Expanded(
              child: Row(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: btnList.entries
                    .map((e) => SideBarBtn(
                        name: e.key,
                        changePage: _changePage,
                        currentPageName: mainBloc.currentPage,
                        icon: e.value))
                    .toList()),
            Expanded(
                child: Container(
                    // color: Colors.grey,
                    ))
          ])),
          Container(
              // color: Colors.blue,
              height: 300,
              child: Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("change country",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15)),
                  Text("change state",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15)),
                ])
              ]))
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
    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 10, 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: name == currentPageName ? 3 : 0))),
        child: InkWell(
            splashColor: Theme.of(context).accentColor,
            onTap: () => changePage(name),
            child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Row(children: [
                  Text(name.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 12)),
                  Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Icon(icon,
                          color: Theme.of(context).iconTheme.color,
                          size: name == "directories" ? 13 : 14))
                ]))));
  }
}
