import 'package:flutter/material.dart';
import 'package:how_to_use_navigation/screen/navigation_screen.dart';
import 'package:how_to_use_navigation/screen/route/route_one_screen.dart';
import 'package:how_to_use_navigation/screen/route/route_three_screen.dart';
import 'package:how_to_use_navigation/screen/route/route_two_screen.dart';


const HOME_ROUTE = '/';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigationScreen(),
      initialRoute: '/',

      /// www.google.com 의 홈페이지는 www.google.com/이다. com 옆에 / 이 붙은게 홈페이지라는 뜻
      routes: {
        HOME_ROUTE: (context) => NavigationScreen(),
        '/one': (context) => RouteOneScreen(),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
