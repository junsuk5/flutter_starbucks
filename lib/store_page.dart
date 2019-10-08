import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_starbucks2/repository/starbucks_repository.dart';

import 'models/supplier.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final _repository = StarbucksRepository();

  final topMenuStrings = ['DT', '리저브', '블론드', '나이트로 콜드 브루', '자차 가능'];

  List<Supplier> items = [];
  List<Supplier> filteredItems = [];

  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _repository.queryStore().then((stores) {
      setState(() {
        items = stores;
        filteredItems = items;
      });
    });

    searchController.addListener(() {
      print(searchController.text);

      setState(() {
        filteredItems = items.where((e) {
          return e.branch.contains(searchController.text);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('매장 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '검색',
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildTopMenuItems(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTopMenuItems() {
    return topMenuStrings.map((text) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: RaisedButton(
          child: Text(text),
          color: Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          onPressed: () {},
        ),
      );
    }).toList();
  }

  Widget _buildItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://5.imimg.com/data5/DC/TD/MY-14296065/coffee-anise-cinnamon-spices-photo-wallpaper-2-copy-500x500.jpg'),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    filteredItems[index].branch,
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.card_giftcard,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                filteredItems[index].address,
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
              Text(
                '100m',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
