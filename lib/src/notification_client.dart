// notificaiton exception base class
abstract class NotificationException implements Exception {
  final Object error;

  NotificationException({required this.error});
}

class SubscribeToTopicException extends NotificationException {
  SubscribeToTopicException({required super.error});
}

class UnsubscribeToTopicException extends NotificationException {
  UnsubscribeToTopicException({required super.error});
}

class GetFcmTokenException extends NotificationException {
  GetFcmTokenException({required super.error});
}

class DeleteFCMToken extends NotificationException{
  DeleteFCMToken({required super.error});
}



// notification sending method.
abstract class NotificationClient {
  Future<String?> getFcmToken();
  Future<void> deleteToken();
  Future<void> subscribeToTopic({required String topic});
  Future<void> unsubscribeFromTopic({required String topic});
}



