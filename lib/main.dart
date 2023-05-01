import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/router/locations.dart';
import 'package:test1/screens/start_screen.dart';
import 'package:test1/screens/splash_screen.dart';
import 'package:test1/states/user_provider.dart';
import 'screens/home_screen.dart';

// 비머 전역 선언
final _routerDelegate = BeamerDelegate(
    // 비머가드
    guards: [BeamGuard(
        pathBlueprints: ['/'],
        check: (context, location) {
            return context.watch<UserProvider>().userState;
          },
        showPage: BeamPage(child: StartScreen())
    )],

    locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation()]
    ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 900),
            child: _splashLodingWidget(snapshot),
          );
        },
    );
  }

  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if(snapshot.hasError) {
      print('에러가 발생하였습니다.');
      return Text('Error');
    } else if(snapshot.hasData) {
      return CarrotApp();
    } else {
      return SplashScreen();
    }
  }
}

class CarrotApp extends StatelessWidget {
  const CarrotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) {
        return UserProvider();
      },
      child: MaterialApp.router(
        theme: ThemeData(
            hintColor: Colors.grey[350],
            fontFamily: 'GmarketSansLight',
            primarySwatch: Colors.orange,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                primary: Colors.white,
                minimumSize: Size(48, 48),
              )
            ),
            textTheme: TextTheme(
              headline5: TextStyle(
                fontFamily: 'GmarketSansLight',
              ),
              button: TextStyle(
                color: Colors.white,
              )
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black87),
              elevation: 2,
              actionsIconTheme: IconThemeData(color: Colors.black),
            ),
        ),
        debugShowCheckedModeBanner: false,
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }
}


