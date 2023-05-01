import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:test1/data/AddressModel.dart';
import 'package:test1/screens/start/address_service.dart';
import 'package:test1/utills/logger.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // 텍스트필드 컨트롤러 변수
  TextEditingController _addressController = TextEditingController();

  AddressModel? _AddressModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            onFieldSubmitted: (text) async {
              _AddressModel = await AddressService().SearchAddressByStr(text);
              setState(() {

              });
            },
            controller: _addressController,
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
          TextButton.icon(
            onPressed: () async {
              Location location = new Location();

              bool _serviceEnabled;
              PermissionStatus _permissionGranted;
              LocationData _locationData;

              _serviceEnabled = await location.serviceEnabled();
              if (!_serviceEnabled) {
                _serviceEnabled = await location.requestService();
                if (!_serviceEnabled) {
                  return;
                }
              }

              _permissionGranted = await location.hasPermission();
              if (_permissionGranted == PermissionStatus.denied) {
                _permissionGranted = await location.requestPermission();
                if (_permissionGranted != PermissionStatus.granted) {
                  return;
                }
              }

              _locationData = await location.getLocation();
              logger.d(_locationData);

              AddressService().findAddressByCoordinate(
                  log: _locationData.longitude!,
                  lat: _locationData.latitude!
              );
            },
            icon: Icon(CupertinoIcons.compass, color: Colors.white,),
            label: Text('현재 위치로 찾기', style: TextStyle(color: Colors.white,)),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: (_AddressModel == null ||
                    _AddressModel!.result == null ||
                    _AddressModel!.result!.items == null)? 0 : _AddressModel!.result!.items!.length,
                itemBuilder: (context, index) {
                  if(_AddressModel == null || _AddressModel!.result == null ||
                    _AddressModel!.result!.items == null ||
                    _AddressModel!.result!.items![index].address == null)
                    return Container();

                  return ListTile(
                      title: Text(_AddressModel!.result!.items![index].address!.road??""),
                      subtitle: Text(_AddressModel!.result!.items![index].address!.parcel??""),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
