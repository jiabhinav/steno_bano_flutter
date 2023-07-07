class ModelCartList {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelCartList({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelCartList.fromJson(dynamic json) {
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
  List<Cart>? cart;

  Payload({
      this.cart});

  Payload.fromJson(dynamic json) {
    if (json['cart'] != null) {
      cart = [];
      json['cart'].forEach((v) {
        cart?.add(Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (cart != null) {
      map['cart'] = cart?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cart {
  int? cartId;
  int? userId;
  String? productName;
  String? image;
  String? color;
  String? createdAt;
  List<Product_sizes>? productSizes;

  Cart({
      this.cartId, 
      this.userId, 
      this.productName, 
      this.image, 
      this.color, 
      this.createdAt, 
      this.productSizes});

  Cart.fromJson(dynamic json) {
    cartId = json['cart_id'];
    userId = json['user_id'];
    productName = json['product_name'];
    image = json['image'];
    color = json['color'];
    createdAt = json['created_at'];
    if (json['product_sizes'] != null) {
      productSizes = [];
      json['product_sizes'].forEach((v) {
        productSizes?.add(Product_sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cart_id'] = cartId;
    map['user_id'] = userId;
    map['product_name'] = productName;
    map['image'] = image;
    map['color'] = color;
    map['created_at'] = createdAt;
    if (productSizes != null) {
      map['product_sizes'] = productSizes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Product_sizes {
  int? cartId;
  int? productSizeId;
  int? cartDetailId;
  String? size;
  int? price;
  int? packing;
  int? box;
  int? cartQty;
  int? pair;

  Product_sizes({
      this.cartId, 
      this.productSizeId, 
      this.size, 
      this.price, 
      this.packing, 
      this.box, 
      this.cartQty, 
      this.pair,
     this.cartDetailId});

  Product_sizes.fromJson(dynamic json) {
    cartId = json['cart_id'];
    productSizeId = json['product_size_id'];
    size = json['size'];
    price = json['price'];
    packing = json['packing'];
    box = json['box'];
    cartQty = json['cart_qty'];
    pair = json['pair'];
    cartDetailId = json['cart_detail_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cart_id'] = cartId;
    map['product_size_id'] = productSizeId;
    map['size'] = size;
    map['price'] = price;
    map['packing'] = packing;
    map['box'] = box;
    map['cart_qty'] = cartQty;
    map['pair'] = pair;
    map['cart_detail_id'] = cartDetailId;
    return map;
  }

}