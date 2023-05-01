import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/user_provider.dart';
import '../../utills/logger.dart';

class IntroPage extends StatelessWidget {
  //페이지 컨트롤러 적용
  PageController controller;

  IntroPage(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d('current user state: ${context.read<UserProvider>().userState}');
    return LayoutBuilder(
      builder: (context, constraints) {
        //기기별 사이즈
        Size size = MediaQuery.of(context).size;

        final imgMap = size.width -32;
        final imgMark = imgMap * 0.2;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Text('당근마켓', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange),),
                Stack(
                  children: [
                    ExtendedImage.asset('assets/images/map.png',
                      width: 400,
                      height: 400,
                    ),
                    Positioned(
                        width: imgMark,
                        height: imgMark,
                        left: imgMap * 0.40,
                        top: imgMap * 0.40,
                        child: ExtendedImage.asset('assets/images/mark.png')
                    ),
                  ],
                ),

                Text('우리 동네 중고 직거래',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GmarketSansBold'),
                ),
                Text('당근마켓은 동네 직거래 마켓이에요. \n내 동네를 설정하고 시작해보세요!',
                  style: TextStyle(fontSize: 13, fontFamily: 'GmarketSansMedium'),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(1, duration: Duration(milliseconds: 700), curve: Curves.easeOut);
                      },
                      child: Text('내 동네 설정하고 시작하기', style: TextStyle(color: Colors.white, fontFamily: 'GmarketSansMedium'),),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
