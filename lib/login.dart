import 'package:flutter/material.dart';
import 'package:flutter_starbucks2/repository/starbucks_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _repository = StarbucksRepository();

  String result = '';
  TextEditingController _username;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _username,
          ),
          TextField(
            controller: _password,
          ),
          RaisedButton(
            child: Text('로그인'),
            onPressed: () async {
              final token = await _repository.login(_username.text, _password.text);

              setState(() {
                result = token;
              });
            },
          ),
          Text(result),
        ],
      ),
    );
  }
}
