class Point {
  String? _x;
  String? _y;

  String? get x => _x;
  String? get y => _y;

  Point({String? x, String? y}) {
    _x = x;
    _y = y;
  }

  Point.fromJson(dynamic json) {
    _x = json['x'];
    _y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = _x;
    map['y'] = _y;
    return map;
  }

}