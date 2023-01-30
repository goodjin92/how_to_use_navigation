import 'package:flutter/material.dart';
import 'package:how_to_use_navigation/layout/navigation_layout.dart';
import 'package:how_to_use_navigation/screen/route/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationLayout(
      title: 'Route One',
      children: [
        Text(
          number.toString(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            // 뒤로 갈 페이지가 없는 경우 뒤로 가지 않음. 만약 pop을 쓰면 뒤로 갈 페이지가 없어서 오류 남
            Navigator.of(context).maybePop();
          },
          child: Text('maybePop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text(
            'Pop',
          ),
        ),

        /// 이렇게 깊게 들어가면 점점 페이지가 쌓임 (=Stack)
        /// 예시) [navigation_screen] > [route_one_screen] > [route_two_screen]
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => RouteTwoScreen(),
                  settings: RouteSettings(
                    arguments: 789,
                  )),
            );
          },
          child: Text('Route Two push'),
        ),
      ],
    );
  }
}
