class CityModel {
  int code;
  String message;
  ZpData zpData;

  CityModel({this.code, this.message, this.zpData});

  CityModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    zpData = json['zpData'] != null ? new ZpData.fromJson(json['zpData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.zpData != null) {
      data['zpData'] = this.zpData.toJson();
    }
    return data;
  }
}

class ZpData {
  List<CityList> cityList;
  LocationCity locationCity;

  ZpData({this.cityList, this.locationCity});

  ZpData.fromJson(Map<String, dynamic> json) {
    if (json['cityList'] != null) {
      cityList = new List<CityList>();
      json['cityList'].forEach((v) {
        cityList.add(new CityList.fromJson(v));
      });
    }
    locationCity = json['locationCity'] != null
        ? new LocationCity.fromJson(json['locationCity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cityList != null) {
      data['cityList'] = this.cityList.map((v) => v.toJson()).toList();
    }
    if (this.locationCity != null) {
      data['locationCity'] = this.locationCity.toJson();
    }
    return data;
  }
}

class CityList {
  String name;
  List<SubLevelModelList> subLevelModelList;

  CityList({this.name, this.subLevelModelList});

  CityList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['subLevelModelList'] != null) {
      subLevelModelList = new List<SubLevelModelList>();
      json['subLevelModelList'].forEach((v) {
        subLevelModelList.add(new SubLevelModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.subLevelModelList != null) {
      data['subLevelModelList'] =
          this.subLevelModelList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubLevelModelList {
  int code;
  String name;
  String tip;
  String subLevelModelList;
  String firstChar;
  String pinyin;
  int rank;

  SubLevelModelList(
      {this.code,
        this.name,
        this.tip,
        this.subLevelModelList,
        this.firstChar,
        this.pinyin,
        this.rank});

  SubLevelModelList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    tip = json['tip'];
    subLevelModelList = json['subLevelModelList'];
    firstChar = json['firstChar'];
    pinyin = json['pinyin'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['tip'] = this.tip;
    data['subLevelModelList'] = this.subLevelModelList;
    data['firstChar'] = this.firstChar;
    data['pinyin'] = this.pinyin;
    data['rank'] = this.rank;
    return data;
  }
}

class LocationCity {
  int code;
  String name;
  String tip;
  String subLevelModelList;
  String firstChar;
  String pinyin;
  int rank;

  LocationCity(
      {this.code,
        this.name,
        this.tip,
        this.subLevelModelList,
        this.firstChar,
        this.pinyin,
        this.rank});

  LocationCity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    tip = json['tip'];
    subLevelModelList = json['subLevelModelList'];
    firstChar = json['firstChar'];
    pinyin = json['pinyin'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['tip'] = this.tip;
    data['subLevelModelList'] = this.subLevelModelList;
    data['firstChar'] = this.firstChar;
    data['pinyin'] = this.pinyin;
    data['rank'] = this.rank;
    return data;
  }
}