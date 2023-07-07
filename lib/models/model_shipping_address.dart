class ModelShippingAddress {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelShippingAddress({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelShippingAddress.fromJson(dynamic json) {
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
  List<Shipping_address>? shippingAddress;

  Payload({
      this.shippingAddress});

  Payload.fromJson(dynamic json) {
    if (json['shipping_address'] != null) {
      shippingAddress = [];
      json['shipping_address'].forEach((v) {
        shippingAddress?.add(Shipping_address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (shippingAddress != null) {
      map['shipping_address'] = shippingAddress?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Shipping_address {
  int? vendorAddressId;
  int? vendorUserId;
  String? name;
  String? email;
  int? mobile;
  String? state;
  String? city;
  String? address;
  int? pincode;

  Shipping_address({
      this.vendorAddressId, 
      this.vendorUserId, 
      this.name, 
      this.email, 
      this.mobile, 
      this.state, 
      this.city, 
      this.address, 
      this.pincode});

  Shipping_address.fromJson(dynamic json) {
    vendorAddressId = json['vendor_address_id'];
    vendorUserId = json['vendor_user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['vendor_address_id'] = vendorAddressId;
    map['vendor_user_id'] = vendorUserId;
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    map['state'] = state;
    map['city'] = city;
    map['address'] = address;
    map['pincode'] = pincode;
    return map;
  }

}