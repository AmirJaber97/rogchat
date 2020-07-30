import 'package:rogchat/app/locator.dart';
import 'package:rogchat/models/user.dart';
import 'package:rogchat/services/firebase_service.dart';
import 'package:rogchat/ui/setup/app_base_model.dart';

class UserProvider extends BaseModel {
  User _user;
  FirebaseService firebaseService = locator<FirebaseService>();

  User get getUser => _user;

  void refreshUser() async {
    User user = await firebaseService.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
