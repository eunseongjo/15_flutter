import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("2. build 호출됨");

    bool isOnboarded = prefs.getBool('isOnboarded') ?? false;

    return MaterialApp(
      // home: Scaffold(),
      debugShowCheckedModeBanner: false,
      home: isOnboarded ? HomePage() : FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('현재의 나'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/cat.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              '현재의 나',
              style: TextStyle(color: Colors.purple, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '저는 골목식당의 백종원 선생님 처럼 \n 여러분들에게 \n 솔루션을 주는 강사입니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                prefs.setBool('isOnboarded', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Skip'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('수료후의 나'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/act.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              '수료 후의 나',
              style: TextStyle(color: Colors.purple, fontSize: 35),
            ),
            SizedBox(height: 10),
            Text(
              '항상 수료 때마다 느끼는 거지만 \n 엄청 성장했더라구요',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LastScreen()),
                );
              },
              child: Text('Next Page'),
            )
          ],
        ),
      ),
    );
  }
}

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('10년 후의 나'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/cat.jpg'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Go HomePage'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              prefs.clear();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome to Home Page',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                  (roote) => false,
                );
              },
              child: Text('Go to First Screen'),
            )
          ],
        ),
      ),
    );
  }
}
