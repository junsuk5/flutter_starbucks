// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_starbucks2/main.dart';
import 'package:flutter_starbucks2/repository/starbucks_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


void main() {
  test('회원가입 테스트', () async {
    final repository = StarbucksRepository();
    final token = await repository.signUp(
        'abcd', 'abcd', 'abcd', '01012341234', '1234qwer!!', '1234qwer!!');

    print('테스트 성공 : $token');
  });

  test('로그인 테스트', () async {
    final repository = StarbucksRepository();
    final token = await repository.login(
        'survivalcoding', 'qwer1234!!');

    expect(token, '9c67ee380d60e8c281e71f68d28712943dbc69b0');
  });

  test('http 통신 테스트', () async {
    var url = 'https://api.airvisual.com/v2/nearest_city?key=YKK6AtsGKLrRZyJht';

    var response = await http.get(url);

    expect(response.statusCode, 200);

    var jsonResponse = convert.jsonDecode(response.body);
    var code = jsonResponse['status'];

    expect(code, 'success');
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
