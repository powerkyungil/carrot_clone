import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/router/locations.dart';
import 'package:test1/screens/auth_screen.dart';
import 'package:test1/screens/splash_screen.dart';
import 'screens/home_screen.dart';

final _routerDelegate = BeamerDelegate(
    guards: [BeamGuard(
        pathBlueprints: ['/'],
        check: (context, location) {return false;},
        showPage: BeamPage(child: AuthScreen())
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
    return MaterialApp.router(
      theme: ThemeData(
          hintColor: Colors.grey[350],
          fontFamily: 'GmarketSansLight',
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
            headline5: TextStyle(
              fontFamily: 'GmarketSansLight',
            ),
            button: TextStyle(
              color: Colors.white,
            )
          )
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}


