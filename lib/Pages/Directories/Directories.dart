import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:yellowbooks/Widgets/Functional/PageHeader.dart';
import 'package:yellowbooks/Widgets/Functional/TabBars/SideTabBar.dart';

class Directories extends StatelessWidget {
  PageController _pageControl = PageController();

  Map<String, Map> _categories = {
    "Hospitals": {},
    "Voting Centers": {},
    "Banks": {},
    "NINC Registration Centers": {},
    "Schools": {},
    "Airports": {},
    "Hospitals1": {},
    "Hospitals2": {},
    "Hospitals3": {},
    "Hospitals4": {},
    "Hospitals5": {},
    "Hospitals6": {},
    "Hospitals7": {},
    "Hospitals8": {},
  };

  List<String> _letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(width: 5),
              Icon(FontAwesomeIcons.bookOpen, size: 15),
              SizedBox(width: 20),
              Text("Directories",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 15)),
            ])),
        body: Row(children: [
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.fromLTRB(15, 30, 5, 50),
                  itemCount: _categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 30),
                  itemBuilder: (BuildContext context, int index) {
                    String key = _categories.keys.elementAt(index);

                    return CategoryPost(key: Key(key), title: key);
                  })),
          SideTabBar(
              control: _pageControl,
              tabs: _letters,
              side: "top",
              fontColor: Theme.of(context).iconTheme.color)
        ]));
  }
}

class CategoryPost extends StatelessWidget {
  final String title;

  const CategoryPost({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        splashColor: Theme.of(context).accentColor,
        child: Container(
            constraints: BoxConstraints(minHeight: 150),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                // border:
                //     Border.all(width: 0.9, color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 13)),
            ])));
  }
}
