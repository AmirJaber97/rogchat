import 'package:get_it/get_it.dart';
import 'package:skype_clone/caches/preferences.dart';
import 'package:skype_clone/services/firebase_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Preferences());
  locator.registerLazySingleton(() => FirebaseService());
}
