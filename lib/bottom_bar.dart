import 'package:ECommerceApp/consts/my_icons.dart';
import 'package:ECommerceApp/screens/feeds.dart';
import 'package:ECommerceApp/screens/user.dart';
import 'package:ECommerceApp/screens/home.dart';
import 'package:ECommerceApp/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomBar extends StatefulWidget {
  // const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // List _pages = [HomeScreen(), FeedsScreen(), CartScreen(), UserScreen()];

  List<Map<String, Object>> _pages = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {"Page": HomeScreen(), "Title": "Home Screen"},
      {"Page": FeedsScreen(), "Title": "Feeds Screen"},
      {"Page": CartScreen(), "Title": "Cart Screen"},
      {"Page": HomeScreen(), "Title": "Search Screen"},
      {"Page": UserScreen(), "Title": "User Screen"}
    ];
    super.initState();
  }

  void selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["Title"]),
      ),
      body: _pages[_selectedIndex]["Page"],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.purple,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.home), tooltip: "Home", label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.feed), tooltip: "Feed", label: "Feed"),
                BottomNavigationBarItem(
                    activeIcon: null,
                    icon: Icon(null),
                    tooltip: "Search",
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(MaterialCommunityIcons.cart),
                    tooltip: "Cart",
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.user), tooltip: "User", label: "User"),
              ],
              onTap: selectedPage),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            backgroundColor: Colors.purple,
            elevation: 5,
            child: Icon(MyAppIcons.search)),
      ),
    );
  }
}
