class OrderList {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  OrderList({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  OrderList.fromJson(dynamic json) {
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
  List<Order_list>? orderList;
  int? totalRecords;
  String? pageNumber;

  Payload({
      this.orderList, 
      this.totalRecords, 
      this.pageNumber});

  Payload.fromJson(dynamic json) {
    if (json['order_list'] != null) {
      orderList = [];
      json['order_list'].forEach((v) {
        orderList?.add(Order_list.fromJson(v));
      });
    }
    totalRecords = json['total_records'];
    pageNumber = json['page_number'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (orderList != null) {
      map['order_list'] = orderList?.map((v) => v.toJson()).toList();
    }
    map['total_records'] = totalRecords;
    map['page_number'] = pageNumber;
    return map;
  }

}

class Order_list {
  int? orderId;
  int? orderNo;
  int? vendorAddressId;
  int? vendorUserId;
  String? name;
  int? mobile;
  String? email;
  int? pincode;
  String? city;
  String? address;
  int? orderStatus;
  String? orderStatusDate;
  String? createdAt;

  Order_list({
      this.orderId, 
      this.orderNo, 
      this.vendorAddressId, 
      this.vendorUserId, 
      this.name, 
      this.mobile, 
      this.email, 
      this.pincode, 
      this.city, 
      this.address, 
      this.orderStatus, 
      this.orderStatusDate, 
      this.createdAt});

  Order_list.fromJson(dynamic json) {
    orderId = json['order_id'];
    orderNo = json['order_no'];
    vendorAddressId = json['vendor_address_id'];
    vendorUserId = json['vendor_user_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    pincode = json['pincode'];
    city = json['city'];
    address = json['address'];
    orderStatus = json['order_status'];
    orderStatusDate = json['order_status_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['order_no'] = orderNo;
    map['vendor_address_id'] = vendorAddressId;
    map['vendor_user_id'] = vendorUserId;
    map['name'] = name;
    map['mobile'] = mobile;
    map['email'] = email;
    map['pincode'] = pincode;
    map['city'] = city;
    map['address'] = address;
    map['order_status'] = orderStatus;
    map['order_status_date'] = orderStatusDate;
    map['created_at'] = createdAt;
    return map;
  }

}