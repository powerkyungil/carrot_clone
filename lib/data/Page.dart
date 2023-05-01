class Page {
  String? _total;
  String? _current;
  String? _size;

  String? get toal => _total;
  String? get current => _current;
  String? get size => _size;

  Page({String? total, String? current, String? size}) {
    _total = total;
    _current = current;
    _size = size;
  }

  Page.fromJson(dynamic json) {
    _total = json['total'];
    _current = json['current'];
    _size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['current'] = _current;
    map['size'] = _size;
    return map;
  }

}