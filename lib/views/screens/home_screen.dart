import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok_test/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(currentIndex: indexPage,
        onTap: (pos){
        setState(() {
          indexPage = pos;
        });
      },
          backgroundColor: backgroundColor,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: addIcon(), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messeges'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      body: Center(
        child: pageScreen[indexPage],
      ),
    );

  }
}
class addIcon extends StatelessWidget {
  const addIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 40,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 3),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(7)),
          ),
          Container(
            margin: EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(7)),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
            ),
          ),
          Center(
            child: Icon(Icons.add,color: Colors.black,),
          )
        ],
      ),
    );
  }
}
