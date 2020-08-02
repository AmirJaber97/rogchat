import 'package:get_it/get_it.dart';
import 'package:rogchat/caches/preferences.dart';
import 'package:rogchat/services/auth_service.dart';
import 'package:rogchat/services/call_service.dart';
import 'package:rogchat/services/chat_service.dart';
import 'package:rogchat/services/push_notifications_service.dart';
import 'package:rogchat/services/storage_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Preferences());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => CallService());
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => PushNotificationService());
}
