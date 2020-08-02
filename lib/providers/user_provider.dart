import 'package:rogchat/app/locator.dart';
import 'package:rogchat/models/user.dart';
import 'package:rogchat/services/auth_service.dart';
import 'package:rogchat/ui/setup/app_base_model.dart';

class UserProvider extends BaseModel {
  User _user;
  AuthService authService = locator<AuthService>();

  User get getUser => _user;

  void refreshUser() async {
    User user = await authService.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
