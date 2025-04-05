import 'package:firebase_messaging/firebase_messaging.dart';

import '../notification.dart';

class FirebaseMessagingClient extends NotificationClient {
  final FirebaseMessaging _fcm;

  FirebaseMessagingClient({required FirebaseMessaging fcm}) : _fcm = fcm;

  @override
  Future<String?> getFcmToken() async {
    try {
      return await _fcm.getToken();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFcmTokenException(error: error), stackTrace);
    }
  }

  @override
  Future<void> subscribeToTopic({required String topic}) async {
    try {
      await _fcm.subscribeToTopic(topic);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          SubscribeToTopicException(error: error), stackTrace);
    }
  }

  @override
  Future<void> unsubscribeFromTopic({required String topic}) async {
    try {
      await _fcm.unsubscribeFromTopic(topic);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          UnsubscribeToTopicException(error: error), stackTrace);
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _fcm.deleteToken();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(DeleteFCMToken(error: error), stackTrace);
    }
  }
}
