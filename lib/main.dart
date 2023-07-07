
import 'package:flutter/material.dart';
import 'session/Session.dart';
import 'src/SplashScreen.dart';

/*//Recieve message when app is in background solution for on message
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('MessagedataBackground: ${message.data.toString()}');
  print('MessagedataBackground: ${message.notification?.body}');
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  //LocalNotificationService.initialize();
  sp.init();
 /* await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);*/
  //initializeDateFormatting('en',null);
  runApp(
    MaterialApp(
        title: 'GridView Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),

      /*  theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: ColorConstants.appColor,
        ),*/
        routes: <String, WidgetBuilder>{
         // "/AddressList": (BuildContext context) => new AddressList(),
        }
    ),

  );



}
