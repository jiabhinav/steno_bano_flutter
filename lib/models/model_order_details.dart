class ModelOrderDetails {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelOrderDetails({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelOrderDetails.fromJson(dynamic json) {
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
  Order_personal? orderPersonal;
  List<Order_products>? orderProducts;
  List<Order_status>? orderStatus;

  Payload({
      this.orderPersonal, 
      this.orderProducts, 
      this.orderStatus});

  Payload.fromJson(dynamic json) {
    orderPersonal = json['order_personal'] != null ? Order_personal.fromJson(json['order_personal']) : null;
    if (json['order_products'] != null) {
      orderProducts = [];
      json['order_products'].forEach((v) {
        orderProducts?.add(Order_products.fromJson(v));
      });
    }
    if (json['order_status'] != null) {
      orderStatus = [];
      json['order_status'].forEach((v) {
        orderStatus?.add(Order_status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (orderPersonal != null) {
      map['order_personal'] = orderPersonal?.toJson();
    }
    if (orderProducts != null) {
      map['order_products'] = orderProducts?.map((v) => v.toJson()).toList();
    }
    if (orderStatus != null) {
      map['order_status'] = orderStatus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Order_status {
  int? orderStatusId;
  int? orderId;
  int? orderStatus;
  String? createdAt;

  Order_status({
      this.orderStatusId, 
      this.orderId, 
      this.orderStatus, 
      this.createdAt});

  Order_status.fromJson(dynamic json) {
    orderStatusId = json['order_status_id'];
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['order_status_id'] = orderStatusId;
    map['order_id'] = orderId;
    map['order_status'] = orderStatus;
    map['created_at'] = createdAt;
    return map;
  }

}

class Order_products {
  int? orderProductId;
  int? orderId;
  String? productName;
  String? image;
  String? color;
  List<Product_sizes>? productSizes;

  Order_products({
      this.orderProductId, 
      this.orderId, 
      this.productName, 
      this.image, 
      this.color, 
      this.productSizes});

  Order_products.fromJson(dynamic json) {
    orderProductId = json['order_product_id'];
    orderId = json['order_id'];
    productName = json['product_name'];
    image = json['image'];
    color = json['color'];
    if (json['product_sizes'] != null) {
      productSizes = [];
      json['product_sizes'].forEach((v) {
        productSizes?.add(Product_sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['order_product_id'] = orderProductId;
    map['order_id'] = orderId;
    map['product_name'] = productName;
    map['image'] = image;
    map['color'] = color;
    if (productSizes != null) {
      map['product_sizes'] = productSizes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Product_sizes {
  int? orderProductDetailId;
  int? orderProductId;
  int? orderId;
  int? productSizeId;
  String? size;
  int? price;
  int? packing;
  int? box;
  int? cartQty;
  int? pair;

  Product_sizes({
      this.orderProductDetailId, 
      this.orderProductId, 
      this.orderId, 
      this.productSizeId, 
      this.size, 
      this.price, 
      this.packing, 
      this.box, 
      this.cartQty, 
      this.pair});

  Product_sizes.fromJson(dynamic json) {
    orderProductDetailId = json['order_product_detail_id'];
    orderProductId = json['order_product_id'];
    orderId = json['order_id'];
    productSizeId = json['product_size_id'];
    size = json['size'];
    price = json['price'];
    packing = json['packing'];
    box = json['box'];
    cartQty = json['cart_qty'];
    pair = json['pair'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['order_product_detail_id'] = orderProductDetailId;
    map['order_product_id'] = orderProductId;
    map['order_id'] = orderId;
    map['product_size_id'] = productSizeId;
    map['size'] = size;
    map['price'] = price;
    map['packing'] = packing;
    map['box'] = box;
    map['cart_qty'] = cartQty;
    map['pair'] = pair;
    return map;
  }

}

class Order_personal {
  int? orderId;
  int? orderNo;
  int? vendorAddressId;
  int? vendorUserId;
  String? name;
  int? mobile;
  String? email;
  int? pincode;
  String? state;
  String? city;
  String? address;
  int? orderStatus;
  String? createdAt;

  Order_personal({
      this.orderId, 
      this.orderNo, 
      this.vendorAddressId, 
      this.vendorUserId, 
      this.name, 
      this.mobile, 
      this.email, 
      this.pincode, 
      this.state, 
      this.city, 
      this.address, 
      this.orderStatus, 
      this.createdAt});

  Order_personal.fromJson(dynamic json) {
    orderId = json['order_id'];
    orderNo = json['order_no'];
    vendorAddressId = json['vendor_address_id'];
    vendorUserId = json['vendor_user_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    orderStatus = json['order_status'];
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
    map['state'] = state;
    map['city'] = city;
    map['address'] = address;
    map['order_status'] = orderStatus;
    map['created_at'] = createdAt;
    return map;
  }

}