import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rogchat/app/locator.dart';
import 'package:rogchat/constants/app_routes.dart';
import 'package:rogchat/enums/notifier_state.dart';
import 'package:rogchat/services/auth_service.dart';
import 'package:rogchat/services/push_notifications_service.dart';
import 'package:rogchat/services/storage_service.dart';
import 'package:rogchat/ui/setup/app_base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();
  final PushNotificationService _pushNotificationService = locator<PushNotificationService>();

  FirebaseUser user;

  LoginViewModel() {
    getCurrentUser();
  }

  Future init() async {
    _pushNotificationService.registerNotification(user.uid);
    _pushNotificationService.configLocalNotification();

//    await _pushNotificationService.initialise();
  }

  Future<FirebaseUser> getCurrentUser() async {
    setNotifier(NotifierState.Loading);
    user = await _authService.getCurrentUser();
    init();
    setNotifier(NotifierState.Loaded);
    return user;
  }

  Future<FirebaseUser> signIn() async {
    FirebaseUser user;
    setNotifier(NotifierState.Loading);
    user = await _authService.signIn();
    setNotifier(NotifierState.Loaded);
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    bool isAuthenticated;
    setNotifier(NotifierState.Loading);
    isAuthenticated = await _authService.authenticateUser(user);
    setNotifier(NotifierState.Loaded);
    return isAuthenticated;
  }

  Future<void> register(FirebaseUser currentUser) async {
    setNotifier(NotifierState.Loading);
    await _authService.register(currentUser);
    setNotifier(NotifierState.Loaded);
  }

  Future<void> signOut() async {
//    setNotifier(NotifierState.Loading);
    await _authService
        .signOut()
        .then((value) => Get.offAndToNamed(RoutePaths.Login));
//    setNotifier(NotifierState.Loaded);
  }
}
