class ModelUpdateProfile {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelUpdateProfile({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelUpdateProfile.fromJson(dynamic json) {
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    message = json['message'];
    errormessage = json['errormessage'];
    type = json['type'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    map['message'] = message;
    map['errormessage'] = errormessage;
    map['type'] = type;
    map['code'] = code;
    return map;
  }

}

class Payload {
  String? profileImage;

  Payload({
      this.profileImage});

  Payload.fromJson(dynamic json) {
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['profile_image'] = profileImage;
    return map;
  }

}