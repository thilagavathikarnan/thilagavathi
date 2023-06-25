import 'dart:async';
import 'dart:convert';

import 'package:comment_box/comment/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:habittrackergad/Components/Accounts/Cash/cashcategory.dart';
import 'package:habittrackergad/Components/Bottombar/Bottombarpage.dart';
import 'package:habittrackergad/Components/Habit/Customhabityearreport.dart';
import 'package:habittrackergad/Components/Task/Taskyearreport.dart';
import 'package:habittrackergad/Components/Registerpage.dart/Register.dart';
import 'package:habittrackergad/Components/Task/Customtaskyearreport.dart';
import 'package:habittrackergad/Components/Task/Taskpage.dart';

import 'package:habittrackergad/contact/contact.dart';
import 'package:habittrackergad/controller/auth_service.dart';
import 'package:habittrackergad/model/push_notifi.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shared_preferences/shared_preferences.dart';


Future _firebaseBackgroundMessagingHandler(RemoteMessage message)
async{
  print("GETLOGINPAGE  ${message.data.toString()}");

}
void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  // PushNotificationManager pushNotificationManager = PushNotificationManager();
  // await pushNotificationManager.initialize();

  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyDwCYX3JgNAb_NgtVHtBRz1lWz8zhuJqoA",
      appId: "1:839972643243:android:b7fa45a8f77263651f32ee",
      messagingSenderId: "839972643243",
      projectId: "habit-tracker-fbe24"
  ));
  final fcm =  await FirebaseMessaging.instance.getToken();
  print("SELETVIIOE");
  print(fcm);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp (
        title: 'Flutter Demo',

        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
var userLoggedIn;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  late int totlaNotifications;
  FirebaseMessaging? _messaging;
  FlutterLocalNotificationsPlugin? fltNotification;

  PushNotifications? _notificationsInfo;
  Future getLoggedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
     userLoggedIn = prefs.getBool('userLoggedIn');
    return userLoggedIn;
  }

  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    var isFirstTime = prefs.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      await prefs.setBool('first_time', false);
      return false;
    } else {
      await prefs.setBool('first_time', false);
      return true;
    }
  }
  void initState() {
    super.initState();
    requestAndRegister();
    totlaNotifications = 0;
    isFirstTime().then((val){
      print("ISFIRSTTIME");
      print(val);
      if(val && val !=null) {
        Timer(
          const Duration(seconds: 10),
              () =>
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  )
        );
      }
      else{
       getLoggedInStatus().then((value){
          if(value != null && value){
            print("Login");
            print(value);
            Timer(
              const Duration(seconds: 3),
                  () =>
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Bottombar(),
                        ),
                      )
            );
          }
          else{
            Timer(
              const Duration(seconds: 3),
                  () =>
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      )
            );
          }

        });
      }
    });
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => Register(),
    //     ),
    //   );
    // });
  }


  void requestAndRegister()
  async{
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessagingHandler);

    NotificationSettings settings = await _messaging!.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized)
    {
      String? deviceToken = await _messaging!.getToken();
      print("DEVICETOKEN: ${deviceToken}");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // print(message.data);
        Get.showSnackbar(
            GetSnackBar(
              mainButton: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: 42,
                height: 42,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(42)),
                  child: Icon(Icons.access_alarm)
                ),
              ),
              titleText: Text("Notify"),
              messageText: Text("getfff"),
              snackPosition: SnackPosition.TOP,
              margin: EdgeInsets.all(20),
              backgroundColor: Get.theme.primaryColor,
              borderColor: Get.theme.focusColor.withOpacity(0.1),
              icon: Icon(Icons.notifications_none, size: 32, color: Get.theme.hintColor),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              borderRadius: 8,
              duration: Duration(seconds: 5),
            )
        );
        print("SETEDVALUES");
        // PushNotifications? notification = PushNotifications(
        //   title:message.notification!.title,
        //   body:message.notification!.body,
        //
        // );
        // setState(() {
        //   _notificationsInfo = notification;
        //   totlaNotifications ++;
        //
        // });
        // showSimpleNotification(
        //   Text("notification"),
        //   // Text(_notificationsInfo!.title.toString()),
        //   leading: badges.Badge(
        //     badgeContent: Text("test"),
        //     // badgeContent: Text(totlaNotifications.toString()),
        //     child: Icon(Icons.notifications),
        //   ),
        //   subtitle: Text(""),
        //   // subtitle: Text(_notificationsInfo!.body.toString()),
        //   background: Colors.orange,
        //   duration: Duration(seconds: 3),
        //
        // );

        // if(_notificationsInfo !=null)
        // {
        //   showSimpleNotification(
        //     Text("notification"),
        //     // Text(_notificationsInfo!.title.toString()),
        //     leading: badges.Badge(
        //       badgeContent: Text("test"),
        //       // badgeContent: Text(totlaNotifications.toString()),
        //       child: Icon(Icons.notifications),
        //     ),
        //     subtitle: Text(""),
        //     // subtitle: Text(_notificationsInfo!.body.toString()),
        //     background: Colors.orange,
        //     duration: Duration(seconds: 3),
        //
        //   );
        // }
      });
      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   fltNotification!.show(
      //       notification.hashCode, notification.title, notification.
      //   body, generalNotificationDetails);
      //   Get.showSnackbar(
      //       GetSnackBar(
      //         mainButton: Container(
      //           margin: const EdgeInsets.symmetric(horizontal: 8.0),
      //           width: 42,
      //           height: 42,
      //           child: ClipRRect(
      //               borderRadius: BorderRadius.all(Radius.circular(42)),
      //               child: Icon(Icons.access_alarm)
      //           ),
      //         ),
      //         titleText: Text("Notify"),
      //         messageText: Text("getfff"),
      //         snackPosition: SnackPosition.TOP,
      //         margin: EdgeInsets.all(20),
      //         backgroundColor: Get.theme.primaryColor,
      //         borderColor: Get.theme.focusColor.withOpacity(0.1),
      //         icon: Icon(Icons.notifications_none, size: 32, color: Get.theme.hintColor),
      //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      //         borderRadius: 8,
      //         duration: Duration(seconds: 5),
      //       )
      //   );      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
            width: 50,
            height: 50,
            child: Image.asset(
              "assets/images/login.png",
            )),
      )),
    );
  }
}
