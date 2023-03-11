import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/utills/logger.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  )
              ),
              hintText: '도로명으로 검색하세요.',
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(CupertinoIcons.compass, color: Colors.white,),
                label: Text('현재 위치로 찾기', style: TextStyle(color: Colors.white,)),
                style: TextButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: ExtendedImage.asset('assets/images/mark.png', color: Colors.orange,),
                      title: Text('address $index'),
                      subtitle: Text('detail $index'),
                      trailing: Icon(Icons.more),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
