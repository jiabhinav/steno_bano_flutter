class ModelSavedProduct {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelSavedProduct({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelSavedProduct.fromJson(dynamic json) {
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
  List<Save_products>? saveProducts;
  int? totalRecords;
  String? pageNumber;

  Payload({
      this.saveProducts, 
      this.totalRecords, 
      this.pageNumber});

  Payload.fromJson(dynamic json) {
    if (json['save_products'] != null) {
      saveProducts = [];
      json['save_products'].forEach((v) {
        saveProducts?.add(Save_products.fromJson(v));
      });
    }
    totalRecords = json['total_records'];
    pageNumber = json['page_number'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (saveProducts != null) {
      map['save_products'] = saveProducts?.map((v) => v.toJson()).toList();
    }
    map['total_records'] = totalRecords;
    map['page_number'] = pageNumber;
    return map;
  }

}

class Save_products {
  int? saveProductId;
  int? userId;
  int? productId;
  dynamic? productName;
  int? productCode;
  String? image;
  String? size;
  String? color;
  int? price;
  String? createdAt;

  Save_products({
      this.saveProductId, 
      this.userId, 
      this.productId, 
      this.productName, 
      this.productCode, 
      this.image, 
      this.size, 
      this.color, 
      this.price, 
      this.createdAt});

  Save_products.fromJson(dynamic json) {
    saveProductId = json['save_product_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productCode = json['product_code'];
    image = json['image'];
    size = json['size'];
    color = json['color'];
    price = json['price'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['save_product_id'] = saveProductId;
    map['user_id'] = userId;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_code'] = productCode;
    map['image'] = image;
    map['size'] = size;
    map['color'] = color;
    map['price'] = price;
    map['created_at'] = createdAt;
    return map;
  }

}