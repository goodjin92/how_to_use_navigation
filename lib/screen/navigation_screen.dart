import 'package:flutter/material.dart';
import 'package:how_to_use_navigation/layout/navigation_layout.dart';
import 'package:how_to_use_navigation/screen/route/route_one_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 뒤로 갈 페이지가 없는 경우 false 출력, 있으면 true
        final canPop = Navigator.of(context).canPop();

        // true = pop 가능
        // false = pop 불가능
        // 시스템적으로 뒤로가기 안되게 할 수 있음
        // 예시) 홈화면에서는 뒤로가기 버튼을 눌러도 앱이 종료되지 않음
        return canPop;
      },
      child: NavigationLayout(title: 'Navigation Screen', children: [
        ElevatedButton(
          onPressed: () {
            // 뒤로 갈 페이지가 없는 경우 false 출력, 있으면 true
            print(Navigator.of(context).canPop());
          },
          child: Text('canPop'),
        ),
        ElevatedButton(
          onPressed: () {
            // 뒤로 갈 페이지가 없는 경우 뒤로 가지 않음. 만약 pop을 쓰면 뒤로 갈 페이지가 없어서 오류 남
            Navigator.of(context).maybePop();
          },
          child: Text('maybePop'),
        ),
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteOneScreen(
                  number: 123,
                ),
              ),
            );
            print(result);
          },
          child: Text(
            'Route One push',
          ),
        ),
      ]),
    );
  }
}
