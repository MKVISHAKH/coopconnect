import 'dart:developer';
import 'package:app_settings/app_settings.dart';
import 'package:cimalite/core/hook/hook.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationServices{
  FirebaseMessaging messaging=FirebaseMessaging.instance;
  void requestNotificationPermission()async{
    NotificationSettings settings=await messaging.requestPermission(
      alert:true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      log('user granted permission');

    }else if(settings.authorizationStatus==AuthorizationStatus.provisional){
       log('user granted provisional permission');
    }else{
      AppSettings.openAppSettings(type: AppSettingsType.notification);
       log('user denied permission');
    }
  }

  
  Future<String?> getDeviceToken()async{
    String? token=await messaging.getToken();
    final value=Deviceinfo(devicetoken: token);
     await SharedPrefManager.instance.setdeviceTkn(value);
    return token;
  }
  void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event){
      event.toString();
      log('refresh');
    });
  }
}