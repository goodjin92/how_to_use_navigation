import 'package:flutter/material.dart';
import 'package:how_to_use_navigation/layout/navigation_layout.dart';
import 'package:how_to_use_navigation/screen/route/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: NavigationLayout(
        title: 'Route Two',
        children: [
          Text(
            'arguments: ${arguments}',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/three',
                arguments: 999,
              );
            },
            child: Text('Push Named'),
          ),

          /// pushReplacement는 이전 페이지를 사라지게 하는 것
          /// 기존 : [NavigationScreen(), RouteOneScreen(), RouteTwoScreen(), RouteThreeScreen()]
          /// pushReplacement : [NavigationScreen(), RouteOneScreen(), RouteThreeScreen()]
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed('/three');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => RouteThreeScreen(),
                ),
              );
            },
            child: Text('pushReplacement'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/three',
                (route) => route.settings.name == '/',
              );
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     builder: (_) => RouteThreeScreen(),
              //   ),
              //   // (route) => false, // false를 하면 기존 페이지를 모두 삭제, true면 모두 살려둠
              //   // (route) => true, // true면 모두 살려둠
              //   (route) =>
              //       route.settings.name == '/', // 해당 name을 가진 route만 살리고 다른건 삭제
              // );
            },
            child: Text('pushAndRemoveUntil'),
          ),
        ],
      ),
    );
  }
}
