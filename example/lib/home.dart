import 'package:flutter/material.dart';
import 'package:bubble_animated_tabbar/bubble_animated_tabbar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController tabController;
  List<Map> children = [
    {
      'icon': Icons.home,
      'title': 'Home',
      'iconSize':23,
      'color': Color.fromRGBO(186, 121, 9, 0.25),
      'textColor': Color.fromRGBO(173, 118, 23, 1),
      'customTextStyle':TextStyle(fontSize: 17, color: Color.fromRGBO(173, 118, 23, 1)),
      'tabPadding': EdgeInsets.fromLTRB(10, 6, 10, 6)
    },
    {
      'icon': Icons.mail,
      'title': 'Messages',
      'iconSize':23,
      'color': Color.fromRGBO(0, 2, 148, 0.22),
      'textColor': Color.fromRGBO(26, 1, 135, 0.9),
      'customTextStyle':TextStyle(fontSize: 17, color: Color.fromRGBO(26, 1, 135, 0.9)),
      'tabPadding': EdgeInsets.fromLTRB(10, 6, 10, 6)
    },
    {
      'icon': Icons.person,
      'title': 'User Account',
      'iconSize':23,
      'color': Color.fromRGBO(18, 140, 126, 0.25),
      'textColor': Color.fromRGBO(6, 125, 111, 1),
      'customTextStyle':TextStyle(fontSize: 17, color: Color.fromRGBO(6, 125, 111, 1)),    
      'tabPadding': EdgeInsets.fromLTRB(10, 6, 10, 6)
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
      'iconSize':23,
      'color': Color.fromRGBO(96, 0, 148, 0.25),
      'textColor': Color.fromRGBO(96, 0, 148, 1),
      'customTextStyle':TextStyle(fontSize: 17, color: Color.fromRGBO(96, 0, 148, 1)),
      'tabPadding': EdgeInsets.fromLTRB(10, 6, 10, 6),
    },
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 0, length: children.length);
    tabController.addListener(onTabViewChange);
  }

  onTabViewChange() {
    setState(() {
      _currentIndex = tabController.index;
    });
  }

  getBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [new BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 1.0, spreadRadius: 1.0)]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      tabController.animateTo(index);
    });
  }

  getPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You are on Page'),
          Text('${_currentIndex + 1}',style: Theme.of(context).textTheme.display1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(children[_currentIndex]['title']),
      ),
      body: TabBarView(
        children: [getPage(), getPage(), getPage(), getPage()],
        controller: tabController,
      ),
      bottomNavigationBar: AnimatedTabbar(
        padding:EdgeInsets.only(left: 4, top: 6, right: 4, bottom: 6),
        containerDecoration: getBoxDecoration(),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        children: children,
      ),
    );
  }
}
