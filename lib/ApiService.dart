
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:steno_bano_flutter/config/URLS.dart';
import 'package:steno_bano_flutter/models/model_business_profile.dart';
import 'package:steno_bano_flutter/models/model_cart_list.dart';
import 'package:steno_bano_flutter/models/model_login.dart';
import 'package:steno_bano_flutter/models/model_notification.dart';
import 'package:steno_bano_flutter/models/model_product_details.dart';
import 'package:steno_bano_flutter/models/model_product_list.dart';
import 'package:steno_bano_flutter/models/model_shipping_address.dart';
import 'package:steno_bano_flutter/models/order_list.dart';
import 'package:steno_bano_flutter/models/model_succes.dart';
import 'package:steno_bano_flutter/session/Session.dart';

import 'package:steno_bano_flutter/utility/Utility.dart';

import 'models/model_dash_board.dart';
import 'models/model_order_details.dart';
import 'models/model_otp.dart';
import 'models/model_saved_product.dart';
import 'models/model_update_profile.dart';


 Future<ModelDashBoard> getDashboard(BuildContext context) async {

     showLoader(context);
    var token= sp.getToken();
    print("dwwdfwfwffw"+token.toString());
    final response = await http.post(
      Uri.parse(URLS.BASE_URL+'dashboard'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode(<String, String>{
        'title': "title",
      }),
    );

    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelDashBoard.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(new ModelDashBoard.fromJson(jsonResponse));
     dismissLoader(context);
      return new ModelDashBoard.fromJson(jsonResponse);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception. Navigator.pop(context);
      dismissLoader(context);
      throw Exception('Failed to create album.');
    }
  }

Future<OrderList> getOrder(BuildContext context,String pageno) async {

  showLoader(context);
  var params = {
    "page_number":pageno
  };
  final response = await http.post(
    Uri.parse(URLS.BASE_URL+'orderList'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': sp.getToken(),
    },
    body: params
  );

  debugPrint("Orderlist==>>>>" + jsonEncode(response.body));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new OrderList.fromJson(jsonResponse));
    dismissLoader(context);
    return new OrderList.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception. Navigator.pop(context);
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}


Future<ModelNotification> getNotification(BuildContext context,String pageno) async {

  showLoader(context);
  var params = {
    "page_number":pageno
  };
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'notificationtList'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("Orderlist==>>>>" + jsonEncode(response.body));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelNotification.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelNotification.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}

 Future<ModelOtp> generateOtp(BuildContext context,String mobile) async {

   showLoader(context);

   var params = {
     "phone":mobile
   };

   Map data = {
     'phone': mobile
   };
   final response = await http.post(
     Uri.parse(URLS.BASE_URL+'generateOtp'),
       body: params
   );

   debugPrint("responseis==>>>>" + jsonEncode(response.body));
   print(ModelOtp.fromJson(jsonDecode(response.body)));
   if (response.statusCode == 200) {
     final jsonResponse = json.decode(response.body);
     print(new ModelOtp.fromJson(jsonResponse));
     Navigator.pop(context);
     return new ModelOtp.fromJson(jsonResponse);
   } else {
     // If the server did not return a 201 CREATED response,
     // then throw an exception.
     Navigator.pop(context);
     throw Exception('Failed to create album.');
   }
 }


  Future<ModelLogin> login(BuildContext context,String mobile,String otp) async {

  showLoader(context);
   var params = {
     "phone":mobile,
     "password":otp
   };
   final response = await http.post(
       Uri.parse(URLS.BASE_URL+'login'),
       body: params
   );

   debugPrint("responseis==>>>>" + jsonEncode(response.body));
   print(ModelLogin.fromJson(jsonDecode(response.body)));
   if (response.statusCode == 200) {
     final jsonResponse = json.decode(response.body);
     print(new ModelLogin.fromJson(jsonResponse));
     Navigator.pop(context);
     return new ModelLogin.fromJson(jsonResponse);
   } else {
     // If the server did not return a 201 CREATED response,
     // then throw an exception.
     Navigator.pop(context);
     throw Exception('Failed to create album.');
   }
 }



  Future<ModelLogin> regsiter(BuildContext context,Map<String,String> map,File gst,File aadhar) async {

  showLoader(context);
  var params = {
    "phone":"9899131677",
    "password":"12345"
  };


  var request = http.MultipartRequest('POST', Uri.parse(URLS.BASE_URL+'register'));
  request.files.add(http.MultipartFile('gst_image',
      gst.readAsBytes().asStream(), gst.lengthSync(),
      filename: gst.toString().split("/").last));

  request.files.add(http.MultipartFile('aadhar_image',
      aadhar.readAsBytes().asStream(), aadhar.lengthSync(),
      filename: aadhar.toString().split("/").last));
  request.fields.addAll(map);

       var result = await request.send();

 // var response = await http.Response.fromStream(result);
  //var response = await result.stream.bytesToString();
  var response = await http.Response.fromStream(result);
  debugPrint("regsiter==>>>>" + response.body);
  //print("regsiterrespnsisi>>>>"+ModelLogin.fromJson(jsonEncode(response.body)).message!);
  if (result.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    //print(new ModelLogin.fromJson(jsonResponse));
    Navigator.pop(context);
    return new ModelLogin.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    Navigator.pop(context);
    throw Exception('Failed to create album.');
  }


}


      Future<ModelUpdateProfile> updateProfile(BuildContext context,File image) async {

  showLoader(context);
  var params = {
    "phone":"9899131677",
    "password":"12345"
  };

  var request = http.MultipartRequest('POST', Uri.parse(URLS.BASE_URL+'updteProfileImage'));
  request.files.add(http.MultipartFile('profile_image',
      image.readAsBytes().asStream(), image.lengthSync(),
      filename: image.toString().split("/").last));
       request.fields.addAll(params);

  Map<String, String> headers= <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
        };
        request.headers.addAll(headers);

  var result = await request.send();
  var response = await http.Response.fromStream(result);
  debugPrint("updateProfileregs==>>>>" + response.body);
   if (result.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    Navigator.pop(context);
    return new ModelUpdateProfile.fromJson(jsonResponse);
  } else {
    Navigator.pop(context);
    throw Exception('Failed to create album.');
  }


}




Future<ModelLogin> updateBusniessProfile(BuildContext context,Map map) async {
  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'editProfile'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("responseis==>>>>" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelLogin.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelLogin.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelLogin.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }

}




   Future<ModelProductDetails> productDetails(BuildContext context,String id) async {

  showLoader(context);
  var params = {
    "product_id":id
  };
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'productDetail'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("responseis==>>>>" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelProductDetails.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelProductDetails.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelProductDetails.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}

Future<ModelSucces> addtoCart(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'addToCart'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}


Future<ModelSucces> saveProduct(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'saveProduct'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}



Future<ModelCartList> getCartList(BuildContext context,String pageno) async {

  showLoader(context);
  var params = {
    "page_number":pageno
  };
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'cartList'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("Orderlist==>>>>" + jsonEncode(response.body));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelCartList.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelCartList.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception. Navigator.pop(context);
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}

Future<ModelProductList> getProductList(BuildContext context,String pageno,String category_id) async {

  showLoader(context);
  var params = {
    "page_number":pageno,
    "category_id":category_id

  };


  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'productList'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelProductList.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    dismissLoader(context);
    final jsonResponse = json.decode(response.body);
    print(new ModelProductList.fromJson(jsonResponse));
    return new ModelProductList.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}


Future<ModelSavedProduct> saveProductList(BuildContext context,String pageno) async {

  showLoader(context);
  var params = {
    "page_number":pageno,

  };

  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'saveProductList'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSavedProduct.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    dismissLoader(context);
    final jsonResponse = json.decode(response.body);
    print(new ModelSavedProduct.fromJson(jsonResponse));
    return new ModelSavedProduct.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}





Future<ModelSucces> updateCart(BuildContext context,Map map) async {

  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'updateCart'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}


Future<ModelSucces> removeCart(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'deleteFromCart'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    dismissLoader(context);
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}

Future<ModelShippingAddress> getShippingAddressList(BuildContext context,String pageno) async {

  showLoader(context);
  var params = {
    "page_number":pageno
  };
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'shippingAddressList'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("shippingAddressList==>>>>" + jsonEncode(response.body));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelShippingAddress.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelShippingAddress.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception. Navigator.pop(context);
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }




}


Future<ModelSucces> orderPlaced(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'orderPlaced'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}

Future<ModelSucces> addShippingAddress(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'addShippingAddress'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}
Future<ModelSucces> deleteShippingAddress(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'deleteShippingAddress'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}




Future<ModelSucces> saveInquiry(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'saveInquiry'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create Inquiries.');
  }
}

Future<ModelSucces> saveHelpSupport(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'saveHelpSupport'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create Inquiries.');
  }
}



 Future<ModelOrderDetails> orderProductDetails(BuildContext context,String id) async {

  showLoader(context);
  var params = {
    "order_id":id
  };
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'orderDetail'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: params
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelOrderDetails.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelOrderDetails.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelOrderDetails.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }

  }

    Future<ModelSucces> cancerlOrder(BuildContext context,Map map) async {

      final response = await http.post(
          Uri.parse(URLS.BASE_URL+'cancelOrder'),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': sp.getToken(),
          },
          body: map
      );

      debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
      print(ModelSucces.fromJson(jsonDecode(response.body)));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(new ModelSucces.fromJson(jsonResponse));
        return new ModelSucces.fromJson(jsonResponse);
      } else {
        dismissLoader(context);
        throw Exception('Failed to create album.');
      }
    }



    Future<ModelBusinessProfile> myProfile(BuildContext context) async {

      showLoader(context);
    final response = await http.post(
      Uri.parse(URLS.BASE_URL+'myProfile'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
     // body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelBusinessProfile.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    dismissLoader(context);
    final jsonResponse = json.decode(response.body);
    print(new ModelBusinessProfile.fromJson(jsonResponse));
    return new ModelBusinessProfile.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}



     Future<ModelSucces> deleteSaveProduct(BuildContext context,Map map) async {

  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'deleteSaveProduct'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("addtoCartresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    dismissLoader(context);
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    return new ModelSucces.fromJson(jsonResponse);
  } else {
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }
}


    Future<ModelSucces> updateToken(BuildContext context,Map map) async {


  final response = await http.post(
    Uri.parse(URLS.BASE_URL+'updateToken'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': sp.getToken(),
    },
     body: map
  );

  debugPrint("updateTokenresponse" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelSucces.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelSucces.fromJson(jsonResponse));
    return new ModelSucces.fromJson(jsonResponse);
  } else {

    throw Exception('Failed to create album.');
  }
}




