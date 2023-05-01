import 'Page.dart';
import 'Result.dart';

class AddressModel {
  Page? _page;
  Result? _result;

  Page? get page => _page;
  Result? get result => _result;
  
  AddressModel({Page? page, Result? result}) {
    _page = page;
    _result = result;
  }

  AddressModel.fromJson(dynamic json) {
    _page = json['page'] != null ? Page.fromJson(json['page']) : null;
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (page != null) {
      map['page'] = _page?.toJson();
    }
    if (result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}