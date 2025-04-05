# 📦 Notification Package

A Dart package for managing Firebase Cloud Messaging (FCM) notifications with topic subscriptions, FCM token handling, and permission requests. Built to integrate with `firebase_messaging` and `permission_handler`.

## ✨ Features

- Request and manage notification permissions
- Subscribe/unsubscribe to FCM topics
- Generate or delete FCM tokens
- Toggle notifications by topic or token
- Easily extendable `NotificationClient` abstraction

## 📥 Getting Started

### 🔄 Clone the Repository

```bash
git clone https://github.com/Bivek10/notification_repository.git
cd notification_repository
```

### 📦 Add the Package to Your Flutter App

create `packages/` folder in a project repo:

```yaml
dependencies:
  notification:
    path: packages/notification_repository
```

> 📌 Make sure you have `firebase_messaging` and `permission_handler` in your project dependencies:

```yaml
dependencies:
  firebase_messaging: ^14.6.7
  permission_handler: ^11.0.1
```

---

## 🚀 Usage

### 1️⃣ Initialize Firebase in your `main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

### 2️⃣ Setup the Notification Repository

```dart
final notificationRepository = NotificationRepository(
  permissions: Permission.notification,
  notificationClient: FirebaseMessagingClient(
    fcm: FirebaseMessaging.instance,
  ),
);
```

### 🔔 Subscribe/Unsubscribe to Topics

```dart
await notificationRepository.toogleNotificationByTopic(
  enable: true,
  topic: 'topic',
);
```

```dart
await notificationRepository.toogleNotificationByTopic(
  enable: false,
  topic: 'news',
);
```

### 🔐 Enable or Disable Notifications via FCM Token

```dart
final token = await notificationRepository.toogleNotificationByToken(enable: true);
print('FCM Token: $token');
```

```dart
await notificationRepository.toogleNotificationByToken(enable: false);
```

### ❓ Check Notification Permission

```dart
final isEnabled = await notificationRepository.isNotificationsEnabled();
print('Notifications enabled: $isEnabled');
```

## ⚠️ Exception Handling

All custom exceptions extend the `NotificationException` class.

```dart
try {
  await notificationRepository.toogleNotificationByTopic(enable: true, topic: 'topic');
} on SubscribeToTopicException catch (e) {
  print('Subscription failed: ${e.error}');
} on NotificationException catch (e) {
  print('Notification error: ${e.error}');
}
```
