import 'package:cofredesenha/src/password/add/addOthers.dart';
import 'package:cofredesenha/src/password/selectType.dart';
import 'package:cofredesenha/src/home/viewPassword.dart';
import 'package:cofredesenha/src/home/profile.dart';
import 'package:cofredesenha/utils/styles.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  int segmentedControlValue = 0;
  int _selectedIndex = 0;
  int _pageIndex = 0;
  late PageController _pageController;


  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
              icon: Icon(Icons.key_off,color: _pageIndex != 0
                  ? DefaultColors.darkColor0
                  : DefaultColors.primaryColor),
              title: 'Senhas'),
          TabItem(
              icon: Icon(Icons.add,color: _pageIndex != 1  ? Colors.white : Colors.white),
          ),
          TabItem(
              icon: Icon(Icons.person,color: _pageIndex != 2
                  ? DefaultColors.darkColor0
                  : DefaultColors.primaryColor),
              title: 'Perfil'),

        ],
        initialActiveIndex: _pageIndex,
        style: TabStyle.fixedCircle,
        onTap: (page) => onPageChanged(page),
        backgroundColor: Colors.white,
        activeColor: DefaultColors.secondaryColor,
        color: DefaultColors.darkColor0,
        elevation: 10,
      ),
      body: PageView(
        children: [
        ViewPassword(),
        SelectType(),
        ProfileView(),
      ],
        controller: _pageController,
        onPageChanged: (page) => onPageChanged(page),
        physics: const NeverScrollableScrollPhysics(),
      ),
      // bottomNavigationBar: _button(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: DefaultColors.secondaryColor,
      //   onPressed: () {
      //     Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => SelectType()));},
      //   child: Icon(Icons.add,color: Colors.white,),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    ViewPassword(),
    ProfileView(),
  ];

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
      _pageController.jumpToPage(page);
    });
  }




      // BottomNavigationBar(
      //   elevation: 50,
      //   iconSize: 25,
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.key_off,color: DefaultColors.secondaryColor),
      //       label: 'Senhas',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person,color: DefaultColors.secondaryColor),
      //       label: 'Perfil',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: DefaultColors.secondaryColor,
      //   unselectedItemColor: DefaultColors.darkColor2,
      //   onTap: _onItemTapped,
      // );
  }


