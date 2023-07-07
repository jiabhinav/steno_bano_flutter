class ModelBusinessProfile {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelBusinessProfile({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelBusinessProfile.fromJson(dynamic json) {
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
  int? userId;
  String? email;
  int? phone;
  int? alternatePhone;
  String? businessName;
  String? businessOnwer;
  String? businessAddress;
  int? zipcode;
  String? gstNumber;
  String? panNumber;
  String? gstImage;
  String? panImage;
  String? aadharImage;
  String? profileImage;

  Payload({
      this.userId, 
      this.email, 
      this.phone, 
      this.alternatePhone, 
      this.businessName, 
      this.businessOnwer, 
      this.businessAddress, 
      this.zipcode, 
      this.gstNumber, 
      this.panNumber, 
      this.gstImage, 
      this.panImage, 
      this.aadharImage, 
      this.profileImage});

  Payload.fromJson(dynamic json) {
    userId = json['user_id'];
    email = json['email'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    businessName = json['business_name'];
    businessOnwer = json['business_onwer'];
    businessAddress = json['business_address'];
    zipcode = json['zipcode'];
    gstNumber = json['gst_number'];
    panNumber = json['pan_number'];
    gstImage = json['gst_image'];
    panImage = json['pan_image'];
    aadharImage = json['aadhar_image'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = userId;
    map['email'] = email;
    map['phone'] = phone;
    map['alternate_phone'] = alternatePhone;
    map['business_name'] = businessName;
    map['business_onwer'] = businessOnwer;
    map['business_address'] = businessAddress;
    map['zipcode'] = zipcode;
    map['gst_number'] = gstNumber;
    map['pan_number'] = panNumber;
    map['gst_image'] = gstImage;
    map['pan_image'] = panImage;
    map['aadhar_image'] = aadharImage;
    map['profile_image'] = profileImage;
    return map;
  }

}