class ModelProductDetails {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelProductDetails({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelProductDetails.fromJson(dynamic json) {
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
  List<Product_images>? productImages;
  int? productId;
  int? productCode;
  String? article;
  String? color;
  String? size;
  int? price;
  int? packing;
  int? box;
  int? pair;
  List<Product_sizes>? productSizes;
  List<Related_products>? relatedProducts;

  Payload({
      this.productImages, 
      this.productId, 
      this.productCode, 
      this.article, 
      this.color, 
      this.size, 
      this.price, 
      this.packing, 
      this.box, 
      this.pair, 
      this.productSizes, 
      this.relatedProducts});

  Payload.fromJson(dynamic json) {
    if (json['product_images'] != null) {
      productImages = [];
      json['product_images'].forEach((v) {
        productImages?.add(Product_images.fromJson(v));
      });
    }
    productId = json['product_id'];
    productCode = json['product_code'];
    article = json['article'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
    packing = json['packing'];
    box = json['box'];
    pair = json['pair'];
    if (json['product_sizes'] != null) {
      productSizes = [];
      json['product_sizes'].forEach((v) {
        productSizes?.add(Product_sizes.fromJson(v));
      });
    }
    if (json['related_products'] != null) {
      relatedProducts = [];
      json['related_products'].forEach((v) {
        relatedProducts?.add(Related_products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (productImages != null) {
      map['product_images'] = productImages?.map((v) => v.toJson()).toList();
    }
    map['product_id'] = productId;
    map['product_code'] = productCode;
    map['article'] = article;
    map['color'] = color;
    map['size'] = size;
    map['price'] = price;
    map['packing'] = packing;
    map['box'] = box;
    map['pair'] = pair;
    if (productSizes != null) {
      map['product_sizes'] = productSizes?.map((v) => v.toJson()).toList();
    }
    if (relatedProducts != null) {
      map['related_products'] = relatedProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Related_products {
  int? productId;
  String? article;
  String? color;
  String? size;
  int? price;
  dynamic? image;

  Related_products({
      this.productId, 
      this.article, 
      this.color, 
      this.size, 
      this.price, 
      this.image});

  Related_products.fromJson(dynamic json) {
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

class Product_sizes {
  int? productSizeId;
  String? size;
  int? price;
  int? packing;
  int? box;
  int? pair;
  bool? checked=false;
  int? cart_qty=1;

  Product_sizes({
      this.productSizeId, 
      this.size, 
      this.price, 
      this.packing, 
      this.box, 
      this.pair,
      this.checked,
    this.cart_qty});

  Product_sizes.fromJson(dynamic json) {
    productSizeId = json['product_size_id'];
    size = json['size'];
    price = json['price'];
    packing = json['packing'];
    box = json['box'];
    pair = json['pair'];
    this.cart_qty = cart_qty;

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['product_size_id'] = productSizeId;
    map['size'] = size;
    map['price'] = price;
    map['packing'] = packing;
    map['box'] = box;
    map['pair'] = pair;
    map['cart_qty'] = cart_qty;
    return map;
  }
}

class Product_images {
  dynamic? productId;
  dynamic? image;

  Product_images({
      this.productId, 
      this.image});

  Product_images.fromJson(dynamic json) {
    productId = json['product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['product_id'] = productId;
    map['image'] = image;
    return map;
  }

}