# 📦 Notification Package

A Dart package for managing Firebase Cloud Messaging (FCM) notifications with topic subscriptions, FCM token handling, and permission requests. Built to integrate with `firebase_messaging` and `permission_handler`.

## ✨ Features

- Request and manage notification permissions
- Subscribe/unsubscribe to FCM topics
- Generate or delete FCM tokens
- Toggle notifications by topic or token
- Easily extendable `NotificationClient` abstraction

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  notification:
    path: ../notification # or use git/path/package name as needed
```
