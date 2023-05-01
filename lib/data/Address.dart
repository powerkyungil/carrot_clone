class Address {
  String? _zipcode;
  String? _category;
  String? _road;
  String? _parcel;
  String? _bldnm;
  String? _bldnmdc;

  String? get zipcode => _zipcode;
  String? get category => _category;
  String? get road => _road;
  String? get parcel => _parcel;
  String? get bldnm => _bldnm;
  String? get bldnmdc => _bldnmdc;

  Address(
  {
    String? zipcode,
    String? category,
    String? road,
    String? parcel,
    String? bldnm,
    String? bldnmdc}) {
      _zipcode = zipcode;
      _category = category;
      _road = road;
      _parcel = parcel;
      _bldnmdc = bldnmdc;
      _bldnm = bldnm;
    }

  Address.fromJson(dynamic json) {
    _zipcode = json['zipcode'];
    _category = json['category'];
    _road = json['road'];
    _parcel = json['parcel'];
    _bldnm = json['bldnm'];
    _bldnmdc = json['bldnmdc'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zipcode'] = _zipcode;
    map['category'] = _category;
    map['road'] = _road;
    map['parcel'] = _parcel;
    map['bldnm'] = _bldnm;
    map['bldnmdc'] = _bldnmdc;
    return map;
  }

}