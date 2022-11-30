import 'package:flutter/material.dart';
import 'package:termproject/history.dart';
import 'package:termproject/member.dart';
import 'package:termproject/login.dart';
import 'package:termproject/room.dart';
import 'register.dart';
import 'camera_ex.dart';
import 'package:termproject/chart.dart';
import 'apitest.dart';
import 'group.dart';
import 'testpage.dart';
import 'login.dart';
import 'apitest.dart';
import 'roomadd1.dart';
import 'apitest.dart';
import 'history.dart';

final List<Widget> pages = <Widget>[
  const MemberPage(),
  RoomListPage(),
  MemberPage(),
  APItestPage()
];
/* 페이지 실행시 2~4번째 지우고 본인 페이지 넣어주세요 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      //앱상단 디버그 띠를 없애기
      title: 'Cleaning Guide',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.lightBlue[100],
        fontFamily: 'content7',

        //primaryColor: Color(0xe8eaf6),

      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.5),
          child: child!,
        );
      },
      initialRoute: '/home',
      routes:{
        '/login':(context)=>const LoginPage(),
        '/modify':(context)=>const ModifyPage(),
        '/home':(context)=>const MyHomePage(),
        '/gc':(context)=>const GroupChoicePage(),//약자 사용
        '/gm':(context)=>const GroupMakePage(),
        '/member':(context)=>const MemberPage(),
        '/api':(context)=> HistoryPage(),

      },

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  final String title='';



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static int _selectedTabIndex =0;
  /* static 변수 나중에 라우터로 변경할 예정 */

  void _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {

     return Scaffold(

      body: pages.elementAt(_selectedTabIndex),



      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTabIndex,
          onTap: _changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'room'),
            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined), label: 'history'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'statistics'),
    ],
        selectedItemColor: Colors.blueAccent,
      )
    );

  }
}

