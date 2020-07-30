import 'package:get_it/get_it.dart';
import 'package:rogchat/caches/preferences.dart';
import 'package:rogchat/services/call_service.dart';
import 'package:rogchat/services/firebase_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Preferences());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => CallService());
}
