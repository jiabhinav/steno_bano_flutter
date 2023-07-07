class ModelDashBoard {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelDashBoard({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelDashBoard.fromJson(dynamic json) {
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
  List<Banners>? banners;
  List<Categories>? categories;

  Payload({
      this.banners, 
      this.categories});

  Payload.fromJson(dynamic json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Categories {
  int? categoryId;
  String? name;
  String? image;
  List<Products>? products;

  Categories({
      this.categoryId, 
      this.name, 
      this.image, 
      this.products});

  Categories.fromJson(dynamic json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['category_id'] = categoryId;
    map['name'] = name;
    map['image'] = image;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
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

class Banners {
  int? bannerId;
  String? image;

  Banners({
      this.bannerId, 
      this.image});

  Banners.fromJson(dynamic json) {
    bannerId = json['banner_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['banner_id'] = bannerId;
    map['image'] = image;
    return map;
  }

}