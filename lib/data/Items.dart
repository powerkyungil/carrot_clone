import 'Address.dart';
import 'Point.dart';

class Items {
  String? _id;
  Address? _address;
  Point? _point;

  String? get id => _id;
  Address? get address => _address;
  Point? get point => _point;

  Items({String? id, Address? address, Point? point}) {
    _id = id;
    _address = address;
    _point = point;
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _point = json['point'] != null ? Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (point != null) {
      map['point'] = _point?.toJson();
    }
    return map;
  }

}