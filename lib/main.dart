import 'package:custom_triangle_button/triangle%20button/triangle_button_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.up,
                      text: 'Top',
                      buttonColor: Colors.blue,
                      buttonTextColor: Colors.white,
                      shadowOffset: Offset(0, 0),
                      size: 100,
                      pointRounding: 0.5,
                      texSize: 20,
                      onTap: () {
                        debugPrint('Top button tapped');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.down,
                      text: 'Bottom',
                      buttonColor: Colors.red,
                      buttonTextColor: Colors.white,
                      shadowOffset: Offset(0, 0),
                      size: 100,
                      pointRounding: 0.5,
                      texSize: 20,
                      onTap: () {
                        debugPrint('Bottom button tapped');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.left,
                      text: 'Left',
                      buttonColor: Colors.green,
                      buttonTextColor: Colors.white,
                      shadowOffset: Offset(0, 0),
                      size: 100,
                      pointRounding: 0.5,
                      texSize: 20,
                      onTap: () {
                        debugPrint('Left button tapped');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.right,
                      text: 'Right',
                      buttonColor: Colors.orange,
                      buttonTextColor: Colors.white,
                      shadowOffset: Offset(0, 0),
                      size: 100,
                      pointRounding: 0.5,
                      texSize: 20,
                      onTap: () {
                        debugPrint('Right button tapped');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.up,
                      text: 'Top',
                      buttonColor: Colors.cyan,
                      buttonTextColor: Colors.white,
                      buttonBorderColor: Colors.blueAccent,
                      buttonShadowColor: Colors.blueAccent,
                      shadowOffset: Offset(4, 3.5),
                      shadowRadius: 2,
                      size: 100,
                      pointRounding: 0.5,
                      child: Icon(Icons.arrow_upward),
                      onTap: () {
                        debugPrint('Top button tapped');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.down,
                      text: 'Bottom',
                      buttonColor: Colors.purple,
                      buttonTextColor: Colors.white,
                      buttonBorderColor: Colors.deepPurpleAccent,
                      buttonShadowColor: Colors.deepPurpleAccent,
                      shadowOffset: Offset(4, 3.5),
                      shadowRadius: 2,
                      size: 100,
                      pointRounding: 0.5,
                      child: Icon(Icons.arrow_downward),
                      onTap: () {
                        debugPrint('Bottom button tapped');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.left,
                      text: 'Left',
                      buttonColor: Colors.teal,
                      buttonTextColor: Colors.white,
                      buttonBorderColor: Colors.tealAccent,
                      buttonShadowColor: Colors.tealAccent,
                      shadowOffset: Offset(4, 3.5),
                      shadowRadius: 2,
                      size: 100,
                      pointRounding: 0.5,
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        debugPrint('Left button tapped');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.grey,
                    child: TriangleButtonWidget(
                      direction: TriangleDirection.right,
                      text: 'Right',
                      buttonColor: Colors.amber,
                      buttonTextColor: Colors.white,
                      buttonBorderColor: Colors.amberAccent,
                      buttonShadowColor: Colors.amberAccent,
                      shadowOffset: Offset(4, 3.5),
                      shadowRadius: 2,
                      size: 100,
                      pointRounding: 0.5,
                      child: Icon(Icons.arrow_forward),
                      onTap: () {
                        debugPrint('Right button tapped');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
