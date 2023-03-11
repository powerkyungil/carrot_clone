import 'package:flutter/material.dart';
import 'package:test1/screens/start/address_page.dart';
import 'package:test1/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  // 페이지 컨트롤러
  PageController _pageController = PageController();

  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          IntroPage(_pageController),
          AddressPage(),
          Container(color: Colors.accents[5],),
        ],
      )
    );
  }
}
