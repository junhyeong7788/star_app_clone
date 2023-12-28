import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone_application/body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false, //바텀 아이콘 라벨 안보이게 해줌
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0; //0일때 앱바가 노출, 1일때는 앱바가 노출되지 않음
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0
          ? AppBar(
              //삼항 연산자를 사용해서 index가 0일때만 AppBar를 노출하도록 함
              title: Text(
                'Instagram',
                style:
                    GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 32,
                  ),
                  onPressed: () {
                    print('Tab favorite');
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.paperplane,
                    size: 32,
                  ),
                  onPressed: () {
                    print('Tab paper');
                  },
                ),
              ],
            )
          : null, //index가 0이 아닐때는 AppBar를 노출하지 않음
      //appbar는 별도의 위젯으로 들어가있다. 그래서 분리하기 까다로움
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index, //어떤 인덱스가 들어가있는지 확인하기 위해 사용
        onTap: (newIndex) => setState(() => index = newIndex),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 28), label: 'Search')
        ],
      ),
    );
  }
}
