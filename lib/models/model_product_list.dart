class ModelProductList {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelProductList({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelProductList.fromJson(dynamic json) {
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
  List<Products>? products;
  int? totalRecords;
  String? pageNumber;

  Payload({
      this.products, 
      this.totalRecords, 
      this.pageNumber});

  Payload.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    totalRecords = json['total_records'];
    pageNumber = json['page_number'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total_records'] = totalRecords;
    map['page_number'] = pageNumber;
    return map;
  }

}

class Products {
  int? productId;
  String? article;
  String? color;
  String? size;
  int? price;
  String? image;

  Products({
      this.productId, 
      this.article, 
      this.color, 
      this.size, 
      this.price, 
      this.image});

  Products.fromJson(dynamic json) {
    productId = json['product_id'];
    article = json['article'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['product_id'] = productId;
    map['article'] = article;
    map['color'] = color;
    map['size'] = size;
    map['price'] = price;
    map['image'] = image;
    return map;
  }

}