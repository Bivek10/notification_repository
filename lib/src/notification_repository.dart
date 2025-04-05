import 'package:notification/notification.dart';
import 'package:permission_handler/permission_handler.dart';

/// {@template notifications_repository}
/// A repository that manages notification permissions, topic subscriptions, and the FCM token.
///
/// Notification preferences for subscription topics can be toggled using [toogleNotificationByTopic].
/// Notification preferences for the FCM token can be toggled using [toogleNotificationByToken].
/// {@endtemplate}

class NotificationRepository {
  final Permission _permission;
  final NotificationClient _notificationClient;

  NotificationRepository(
      {required Permission permissions,
      required NotificationClient notificationClient})
      : _permission = permissions,
        _notificationClient = notificationClient;

  Future<void> _requestNotificationPermission() async {
    final permissionStatus = await Permission.notification.status;

    if (permissionStatus.isPermanentlyDenied || permissionStatus.isRestricted) {
      await openAppSettings();
      return;
    }

    if (permissionStatus.isDenied) {
      final permissionStatus = await Permission.notification.request();

      if (!permissionStatus.isGranted) {
        return;
      }
    }
  }

  /// subscribe to [topic] when [enable] is true
  /// unsubscribe [topic] when [enable] is false
  Future<void> toogleNotificationByTopic(
      {required bool enable, required String topic}) async {
    await _requestNotificationPermission();
    if (enable) {
      await _notificationClient.subscribeToTopic(topic: topic);
    } else {
      await _notificationClient.unsubscribeFromTopic(topic: topic);
    }
  }

  /// return the fcm token when [enable] is true
  /// when [enable] is false messages sent by the server to this token will fail.
  Future<String?> toogleNotificationByToken({required bool enable}) async {
    await _requestNotificationPermission();
    if (enable) {
      return await _notificationClient.getFcmToken();
    } else {
      await _notificationClient.deleteToken();
    }
    return null;
  }

  // returns true when the notification permission is granted
  Future<bool> isNotificationsEnabled() async {
    try {
      final permissionStatus = await Permission.notification.request();

      return permissionStatus.isGranted;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        error,
        stackTrace,
      );
    }
  }
}
