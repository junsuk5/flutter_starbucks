import 'package:flutter/material.dart';
import 'package:flutter_starbucks2/login.dart';
import 'package:flutter_starbucks2/menu_page.dart';
import 'package:flutter_starbucks2/store_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        children: <Widget>[
          FlatButton(
            child: Text("전체 메뉴"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
          FlatButton(
            child: Text("매장 검색"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StorePage()),
              );
            },
          ),
          FlatButton(
            child: Text("로그인"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          FlatButton(
            child: Text("주문"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StorePage()),
              );
            },
          ),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
