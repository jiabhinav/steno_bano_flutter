import 'dart:async';
import 'package:flutter/material.dart';
import 'package:steno_bano_flutter/models/model_login.dart';
import 'package:steno_bano_flutter/session/Session.dart';
import 'package:steno_bano_flutter/utility/Utility.dart';

import '../auth/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin  {

   late ModelLogin user;

  @override
  void initState() {
    super.initState();


    Timer(
        Duration(seconds: 2),
            () =>
     loadSharedPrefs());




  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: getLogo(110, 0)
      ),
    );
  }

  loadSharedPrefs() async {

      print("sessions toeknis"+sp.getToken().toString());
       if(sp.checkKey())
       {
         if (sp.getToken()!=null ) {
         //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomeMain()), (e) => false);
         }
         else
         {
         //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Login()), (e) => false);
           /*  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Login();
              },
            ));*/
         }
         }
       else
         {
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Login()), (e) => false);
         }


  }



}