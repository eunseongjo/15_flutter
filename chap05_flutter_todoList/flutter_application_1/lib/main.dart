import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //파이어베이스 초기화
import 'package:firebase_messaging/firebase_messaging.dart'; //푸시 알림 처리

void main() {
  //앱 실행 전 플러터 바인딩이 초기화 되도록
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //비동기 작업 상태에 따라서 빌드
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          //에러가 나면
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          // 선언 완료 후 표시될 위젯
          if (snapshot.connectionState == ConnectionState.done) {
            _getToken();
            _initFriebaseMessaging(context);
            return Scaffold(
              body: Center(
                child: Text(
                  '알림 받을 준비 완료~',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  //비동기로 토큰을 가져옴
  _getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    print("messaging.getToken(), ${await messaging.getToken()}");
  }

  //푸시 알림을 처리해주는 메소드
  _initFriebaseMessaging(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      //메세지 제목 출력
      print(event.notification!.title);
      //메세지 본문 출려
      print(event.notification!.body);
      //다이얼로그를 화면에 띄움
      showDialog(
          context: context,
          builder: (BuildContext context) {
            //다이얼로그 위젯
            return AlertDialog(
              title: Text('알림'),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    });
  }
}
