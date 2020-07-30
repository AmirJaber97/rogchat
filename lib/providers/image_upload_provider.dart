import 'package:rogchat/enums/notifier_state.dart';
import 'package:rogchat/ui/setup/app_base_model.dart';

class ImageUploadProvider extends BaseModel {
  void setToLoading() {
    setNotifier(NotifierState.Loading);
    notifyListeners();
  }

  void setToIdle() {
    setNotifier(NotifierState.Loaded);
    notifyListeners();
  }
}
