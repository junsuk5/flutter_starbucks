import 'package:flutter/material.dart';
import 'package:flutter_starbucks2/models/coffee.dart';
import 'package:flutter_starbucks2/repository/starbucks_repository.dart';
import 'package:provider/provider.dart';

class DrinkPage extends StatefulWidget {
  @override
  _DrinkPageState createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {

  @override
  Widget build(BuildContext context) {
    final coffeeList = Provider.of<List<Coffee>>(context);

    final repository = Provider.of<StarbucksRepository>(context);


    return Column(
      children: <Widget>[
        RaisedButton(onPressed: () {
          repository.loadProduct();
        },),
        ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: coffeeList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: _buildItem(index),
                onTap: () {
                  print(coffeeList[index]);

                  // navpush
                },
              );
            }),
      ],
    );
  }

  Widget _buildItem(int index) {
    final coffeeList = Provider.of<List<Coffee>>(context);
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
                    coffeeList[index].name,
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
                coffeeList[index].menuCategory,
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
              Text(
                '${coffeeList[index].price}원',
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
