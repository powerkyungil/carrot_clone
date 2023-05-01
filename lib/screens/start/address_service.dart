import 'dart:math';

import 'package:dio/dio.dart';
import 'package:test1/data/AddressModel.dart';

import '../../constants/keys.dart';
import '../../utills/logger.dart';

class AddressService {
  Future<AddressModel> SearchAddressByStr(String text) async {
    final formData = {
      'request' : 'search',
      'key' : VWORLD_KEY,
      'query' : 'text',
      'type' : 'ADDRESS',
      'category' : text,
      'size' : 30,
    };

    // http통신 응답결과 받기
    final response = await Dio().get('http://api.vworld.kr/req/search', queryParameters: formData).catchError((e) {
      logger.e(e.message);
    });
    // 응답결과 확인
    logger.d(response);
    logger.d(response.data["response"]['result']);

    // api 오브젝트 모델 연동
    AddressModel addressModel = AddressModel.fromJson(response.data['response']);
    logger.d(addressModel);
    return addressModel;
  }

  Future<void> findAddressByCoordinate ({required double log, required double lat}) async {
    final Map<String, dynamic> formDate = {
      'key' : VWORLD_KEY,
      'service' : 'address',
      'request' : 'GetAddress',
      'type' : 'BOTH',
      'point' : '$log, $lat'
    };
    final response = await Dio()
      .get('http://api.vworld.kr/req/address',
        queryParameters: formDate).catchError((e) {logger.e(e.message); }
      );
    logger.d(response);
    return;
  }
}