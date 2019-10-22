import 'package:flutter/material.dart';
import 'package:flutter_starbucks2/drink_page.dart';
import 'package:flutter_starbucks2/food_page.dart';
import 'package:flutter_starbucks2/models/coffee.dart';
import 'package:flutter_starbucks2/product_page.dart';
import 'package:flutter_starbucks2/repository/starbucks_repository.dart';
import 'package:flutter_starbucks2/reservation_page.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('전체 메뉴'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '음료',
                icon: Icon(Icons.local_drink),
              ),
              Text('푸드'),
              Text('상품'),
              Text('예약'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            StreamProvider<List<Coffee>>.value(
              value: Provider.of<StarbucksRepository>(context).coffeeListStream,
              child: DrinkPage(),
            ),
            FoodPage(),
            ProductPage(),
            ReservationPage(),
          ],
        ),
      ),
    );
  }
}
