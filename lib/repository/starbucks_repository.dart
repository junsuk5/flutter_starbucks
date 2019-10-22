import 'dart:convert';

import 'package:flutter_starbucks2/models/coffee.dart';
import 'package:flutter_starbucks2/models/supplier.dart';
import 'package:http/http.dart' as http;

class StarbucksRepository {

  List<Coffee> coffeeList = [];

  StarbucksRepository() {
    queryProduct().then((value) {
      coffeeList = value;
    });
  }

  /// 음료 리스트
  Future<List<Coffee>> queryProduct() async {
    final List<Coffee> items = [];

    final url = 'http://54.180.153.12:8000/product/';
    final response = await http.get(url);

    final jsonObj = json.decode(response.body);

    jsonObj.forEach((e) {
      Coffee coffee = Coffee.fromJson(e);
      items.add(coffee);
    });

    return items;
  }

  /// 매장 리스트
  Future<List<Supplier>> queryStore() async {
    final List<Supplier> items = [];

    final url = 'http://54.180.153.12:8000/supplier/';
    final response = await http.get(url);

    final jsonObj = json.decode(response.body);

    jsonObj.forEach((e) {
      Supplier supplier = Supplier.fromJson(e);
      items.add(supplier);
    });

    return items;
  }

  /// 회원 가입
  Future<String> signUp(
    String username,
    String nickname,
    String name,
    String phone,
    String password1,
    String password2,
  ) async {
    final url = 'http://54.180.153.12:8000/rest-auth/registration/';
    final response = await http.post(url, body: {
      'username': username,
      'nickname': nickname,
      'name': name,
      'phone': phone,
      'password1': password1,
      'password2': password2
    });

    final jsonObj = json.decode(response.body);
    return jsonObj['key'];
  }

  /// 로그인
  Future<String> login(
    String username,
    String password,
  ) async {
    final url = 'http://54.180.153.12:8000/rest-auth/login/';
    final response = await http
        .post(url, body: {'username': username, 'password': password});

    final jsonObj = json.decode(response.body);
    return jsonObj['key'];
  }

  /// 주문하기
  Future<dynamic> order(dynamic body) async {
    final url = 'http://54.180.153.12:8000/order/';
    final response = await http.post(url, body: body);

    final jsonObj = json.decode(response.body);
    return jsonObj;
  }
}
