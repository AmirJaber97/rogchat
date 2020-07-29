import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rogchat/app/locator.dart';
import 'package:rogchat/constants/app_routes.dart';
import 'package:rogchat/enums/notifier_state.dart';
import 'package:rogchat/services/firebase_service.dart';
import 'package:rogchat/ui/setup/app_base_model.dart';

class LoginViewModel extends BaseModel {
  final FirebaseService _firebaseService = locator<FirebaseService>();
  FirebaseUser user;

  LoginViewModel() {
    getCurrentUser();
  }

  Future<FirebaseUser> getCurrentUser() async {
//    FirebaseUser user;
    setNotifier(NotifierState.Loading);
    user = await _firebaseService.getCurrentUser();
    setNotifier(NotifierState.Loaded);
    return user;
  }

  Future<FirebaseUser> signIn() async {
    FirebaseUser user;
    setNotifier(NotifierState.Loading);
    user = await _firebaseService.signIn();
    setNotifier(NotifierState.Loaded);
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    bool isAuthenticated;
    setNotifier(NotifierState.Loading);
    isAuthenticated = await _firebaseService.authenticateUser(user);
    setNotifier(NotifierState.Loaded);
    return isAuthenticated;
  }

  Future<void> register(FirebaseUser currentUser) async {
     setNotifier(NotifierState.Loading);
    await _firebaseService.register(currentUser);
    setNotifier(NotifierState.Loaded);
  }

  Future<void> signOut() async {
//    setNotifier(NotifierState.Loading);
    await _firebaseService.signOut().then((value) => Get.offAndToNamed(RoutePaths.Login));
//    setNotifier(NotifierState.Loaded);
  }
}
