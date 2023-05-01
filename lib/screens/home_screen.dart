import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/states/user_provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final GlobalKey topKey = GlobalKey();
  final GlobalKey bottomKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈스크린',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserProvider>().SetUserAuth(false);
              },
              icon: Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: topKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset('assets/images/map.png'),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 200,
                        margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text("A영역", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 200,
                        margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text("A영역", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 200,
                        margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text("A영역", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 200,
                        margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text("A영역", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 600,
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/mark.png'), width: 100, height: 100,),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 200,
                              margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text("A영역", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 200,
                              margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text("A영역", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 200,
                              margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text("A영역", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 200,
                              margin: EdgeInsets.only(right: 2.5, left: 2.5, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text("A영역", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            )

          ],
        ),
      ),


    );
  }

}
