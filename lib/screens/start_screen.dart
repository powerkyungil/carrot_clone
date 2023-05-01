import 'package:flutter/material.dart';
import 'package:test1/screens/start/address_page.dart';
import 'package:test1/screens/start/auth_page.dart';
import 'package:test1/screens/start/intro_page.dart';

class StartScreen extends StatelessWidget {
  // 페이지 컨트롤러
  PageController _pageController = PageController();

  StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          IntroPage(_pageController),
          AddressPage(),
          AuthPage(),
        ],
      )
    );
  }
}
