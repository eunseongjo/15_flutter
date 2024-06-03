import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // 상태가 없는 위젯
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('AppBar 박진현'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                // 가로로 배치
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.limeAccent,
                        child: Text('컨테이너'),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      Text(
                        'hello',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.ice_skating,
                    color: Colors.indigo[300],
                    size: 200,
                  )
                ],
              ),
              Image.asset('assets/images/cat.jpg'),
              Image.network(
                  'https://gratisography.com/wp-content/uploads/2023/10/gratisography-cool-cat-800x525.jpg'),
              Image.network(
                  'https://gratisography.com/wp-content/uploads/2023/05/gratisography-colorful-cat-free-stock-photo-800x525.jpg'),
              TextField(
                decoration: InputDecoration(labelText: 'input'),

                //입력폼에 값이 변경될 경우 작동한다.
                onChanged: (text) {
                  //print(text);
                },
                onSubmitted: (text) {
                  print("enter 누름 : $text");
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
