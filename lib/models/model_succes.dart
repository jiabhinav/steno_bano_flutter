class ModelSucces {
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelSucces({
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelSucces.fromJson(dynamic json) {
    message = json['message'];
    errormessage = json['errormessage'];
    type = json['type'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    map['errormessage'] = errormessage;
    map['type'] = type;
    map['code'] = code;
    return map;
  }

}