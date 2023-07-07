 import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService
 {
   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

   static void initialize()
   {
     final InitializationSettings initializationSettings=InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));
     flutterLocalNotificationsPlugin.initialize(initializationSettings);
   }
   static void display(RemoteMessage message)
   async {
     try {
       final body = json.decode(message.notification!.body!);
       Random random = new Random();
       final id = random.nextInt(10000);
       RemoteNotification notification = message.notification!;
       final notificationdetails=NotificationDetails(android: AndroidNotificationDetails(
         /*  "jqrvendor",*/
           notification.title!,
           body['notification'],
           importance: Importance.max,
           priority: Priority.high
         // other properties...
       )
       );

        await flutterLocalNotificationsPlugin.show(
           id,
           notification.title,
            body['notification'],
          notificationdetails
           );
     } on Exception catch (e) {
      print(e);
     }
   }

 }
