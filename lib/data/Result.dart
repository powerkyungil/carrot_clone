import 'Items.dart';

class Result {
  String? _crs;
  String? _type;
  List<Items>? _items;

  String? get crs => _crs;
  String? get type => _type;
  List<Items>? get items => _items;

  Result({String? crs, String? type, List<Items>? items}) {
    _crs = crs;
    _type = type;
    _items = items;
  }

  Result.fromJson(dynamic json) {
    _crs = json['crs'];
    _type = json['type'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crs'] = _crs;
    map['type'] = _type;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}