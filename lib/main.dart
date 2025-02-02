import 'package:ecommericeapp/features/push_notification/pushnotification_api.dart';
import 'package:ecommericeapp/startscreen.dart';
import 'package:ecommericeapp/utils/theme/Light_and_dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("🔵 Background message received: ${message.notification?.title}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.initialize();

  // Local Notifications Initialization
  runApp(GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: light_dark_theme.lighttheme,
        darkTheme: light_dark_theme.darktheme,
        home: startscreen(),
      )
  );
}












