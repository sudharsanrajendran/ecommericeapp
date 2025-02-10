import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;

class Localnotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Initialize Local Notifications
  static Future initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print("Notification response: ${details.payload}");
      },
    );
  }

  // Request Notification Permission
  static Future requestPermission() async {
    final permissionStatus = await Permission.notification.request();
    if (permissionStatus != PermissionStatus.granted) {
      print("Notification permission denied");
    }
  }

  // Normal Notification (Simple Notification)
  static Future showSimpleNotification({required String title, required String body}) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'normal_channel', 'Normal Notifications',
      channelDescription: 'Simple notification channel',
      importance: Importance.max, priority: Priority.high,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }

  // Periodic Notification
  static Future schedulePeriodicNotification() async {
    try {
      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'periodic_channel_id', 'Periodic Notifications',
        channelDescription: 'This channel is for periodic notifications',
        importance: Importance.high, priority: Priority.high,
      );
      const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);
      await flutterLocalNotificationsPlugin.periodicallyShow(
          0, 'Reminder', 'This is your periodic notification!',
          RepeatInterval.everyMinute, notificationDetails, androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
      );
    } catch (e) {
      print('Error in scheduling periodic notification: $e');
    }
  }

  // Scheduled Notification (Timezone-based)
  static Future showScheduledNotification(int id, String title, String body, DateTime scheduleTime) async {
    tzData.initializeTimeZones();
    final location = tz.getLocation('Asia/Kolkata');
    final scheduledDate = tz.TZDateTime.from(scheduleTime, location);

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'scheduled_channel_id', 'Scheduled Notifications',
      channelDescription: 'This channel is for scheduled notifications',
      importance: Importance.max, priority: Priority.high,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, scheduledDate, notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exact, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime
    );
  }

  // Push Notification Handler (FCM)
  static Future<void> handlePushNotification(RemoteMessage message) async {
    if (message.notification != null) {
      // Show Push Notification as Local Notification
      showSimpleNotification(title: message.notification?.title ?? '', body: message.notification?.body ?? '');
    }
  }

  // Cancel all Notifications
  static Future cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
