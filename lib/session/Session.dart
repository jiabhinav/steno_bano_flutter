import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steno_bano_flutter/models/model_login.dart';
import 'package:steno_bano_flutter/models/model_shipping_address.dart';


class Session {
late SharedPreferences _pref;

    init() async{
      _pref=await SharedPreferences.getInstance();
    }

    getToken(){
         return _pref.getString('token');
    }
      getName()  {
        return _pref.getString('name');
      }
      getEmail()  {
        return _pref.getString('email');
      }
      getMobile()  {
        return _pref.getString('mobile');
      }
      getProfile()  {
        return _pref.getString('profile');
      }

    getId()  {
        return _pref.getString('id');
    }


read2() async {

  Map userMap = jsonDecode(_pref.getString('info_jqr')!);
  var user = ModelLogin.fromJson(userMap);
  return user;
}


  save(ModelLogin? modelLogin) async {

    _pref.setString('token', modelLogin!.payload!.token!);
    _pref.setString('id', modelLogin.payload!.userId.toString());
    _pref.setString('name', modelLogin.payload!.businessName.toString());
    _pref.setString('mobile', modelLogin.payload!.phone.toString());
    _pref.setString('email', modelLogin.payload!.email!);
    _pref.setString('profile', modelLogin.payload!.profileImage.toString());
    getToken();
   }

  void setProfile(String image)
  {
    if(image!=null)
      {
        _pref.setString('profile',image.toString());
      }

  }

  checkKey()
  {
    if(_pref.containsKey('token'))
      {
        return true;
      }
    else{
      return false;
    }
  }


  saveUpdate(ModelLogin? modelLogin) async {

  _pref.setString('id', modelLogin!.payload!.userId.toString());
  _pref.setString('name', modelLogin.payload!.businessName.toString());
  _pref.setString('mobile', modelLogin.payload!.phone.toString());
  _pref.setString('email', modelLogin.payload!.email.toString());
  _pref.setString('profile', modelLogin.payload!.profileImage.toString());
  getToken();
}


  save2(ModelLogin? modelLogin) async {
    String user = jsonEncode(ModelLogin.fromJson(modelLogin));
    //   String storePayment = jsonEncode(modelLogin?.toJson());
    _pref.setString('info_jqr', user);
  }


      saveAddress2(Shipping_address? shipping_address) async {
      //String user = jsonEncode(shipping_address);
      _pref.setString('add_name', shipping_address!.name.toString());
      _pref.setString('add_id', shipping_address.vendorAddressId.toString());
      _pref.setString('add_email', shipping_address.email.toString());
      _pref.setString('add_mobile', shipping_address.mobile.toString());
      _pref.setString('add_address', shipping_address.address.toString());

    }

    saveAddress(Shipping_address? shipping_address) async {
    String user = jsonEncode(shipping_address);
    //   String storePayment = jsonEncode(modelLogin?.toJson());
    _pref.setString('info_address', user);
    getAddress();
     }


   Future<Shipping_address?>getAddress() async {
        Map<String,dynamic> userMap = jsonDecode(_pref.getString('info_address')!);
        Shipping_address? user= Shipping_address.fromJson(userMap);
        print("savedaddressis"+user.name!);
        return user;
      }


  logoutApp() async {
    _pref.clear();
  }

}

Session sp=Session();