import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:steno_bano_flutter/color/MyColor.dart';
import 'package:steno_bano_flutter/models/model_login.dart';
import 'package:steno_bano_flutter/service/LocalNotificationService.dart';

import 'package:steno_bano_flutter/utility/Utility.dart';
import '../ApiService.dart';
import 'package:steno_bano_flutter/session/Session.dart';

/*
class HomeMain extends StatefulWidget {
  static ModelLogin? modelLogin;


  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<HomeMain> {


  int _currentIndex = 0;
  late String _title;
  var profile=null;
  final List<Widget> _children = [
   // HomePage(), Order(),Notifications(), MyProfile(),
  ];

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    _title="Home";
    super.initState();



    profile=sp.getProfile();
    initilaize();
  }





  void initilaize() async {


    String? token = await messaging.getToken(vapidKey: "BISj9mf42g_FTxMxeiQvtDb4G4HlENTQGVWjNLxuZgaFtGyCiovinChtoLXxSKs2i8vUlYJXw9_TfDHaYt5Onp0");
    print("wdwddwdwdwd==="+token!);
    var params = {
      "token":token,
    };
    updateToken(context,params).then((value) => {

    });


    // gives you the message on when user taps
    // and it open app fro terminited state
    messaging.getInitialMessage().then((message) => {
        //final routefromMessage=message.data["route"]

    if (message!.notification != null) {
      print(message.data["route"]),
      showToast(message.data["route"], 2)
      }

  });

  // forground work

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.notification!.title}');
      final body = json.decode(message.notification!.body!);
      message.notification!.body!=body['notification'];
      print('Message data: ${body['notification']}');
      if (message.notification != null) {
        //showToast(message.data["route"], 1);
        print('Message also contained a notification: ${ message.notification!.body!}');
        LocalNotificationService.display(message);
      }
    });

    // when the app is in background but opend and user taps
  // on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routefromMessage=message.data["route"];
      print(routefromMessage);

    });




  }






  @override
  Widget build(BuildContext context) {


    return OverlaySupport(
      child: Scaffold(
        appBar: AppBar(title: Text(_title,style: TextStyle(color: Colors.black,fontSize: 18),),
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: ColorConstants.appColor,
              ),
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (_) => CartList()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.chat,
                color: ColorConstants.appColor,
              ),
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (_) => Chat_Inbox()));
              },
            )

          ],),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(

                height: 150.0,
                decoration: BoxDecoration(
                    color: ColorConstants.appColor
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child:  Text(sp.getName()==null?"Add Name":sp.getName()==""?"Add Name":sp.getName(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child:  Text(sp.getMobile()==null?"Add Mobile":sp.getMobile()==""?"Add Mobile":sp.getMobile(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),

                  */
/* child: Text('Abhinav', style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                      color: ColorConstants.appColor
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0)*//*

                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Account"),

              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Message to Company"),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap:() =>
                {
                  dialogLogoutBottomSheet(context)
                },
              )

            ],
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const<BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/image/order.png')),
              label: 'Order History',

            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/image/notification.png')),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/image/profile.png')),
              label: 'Profile',
            ),

          ],
          currentIndex: _currentIndex,
          onTap: onTabTapped,

        ),
      ),


    );

  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'Order';
          }
          break;
        case 2:
          {
            _title = 'Notification';
          }
          break;
        case 3:
          {
            _title = 'Profile';
          }
          break;
      }
    });
  }

  void logout()
  {
    sp.logoutApp();
    SystemNavigator.pop();
  }



}*/
