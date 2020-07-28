import 'package:hive/hive.dart';
import 'package:skype_clone/app/logger.dart';

class Preferences {
  var logger = getLogger("Preferences");

  static const _preferencesBox = '_preferencesBox';
  static const _firstLaunch = '_firstLaunch';
  static const _darkMode = '_darkMode';
  static const _currentLanguage = '_currentLanguage';

  Box<dynamic> _box;

  Future openBox() async {
    this._box = await Hive.openBox<dynamic>(_preferencesBox);
  }

  bool isFirstLaunch() => _getValue(_firstLaunch) ?? true;

  Future<void> setFirstLaunch(bool firstLaunch) =>
      _setValue(_firstLaunch, firstLaunch);

  bool darkMode() => _getValue(_darkMode) ?? false;

  Future<void> setDarkMode(bool darkMode) => _setValue(_darkMode, darkMode);

  getLanguage() => _getValue(_currentLanguage);

  Future<void> setLanguage(String language) =>
      _setValue(_currentLanguage, language);

  T _getValue<T>(dynamic key, {T defaultValue}) {
    logger.i(
        "Cache => Received ${_box.get(key, defaultValue: defaultValue) as T} from $key");
    return _box.get(key, defaultValue: defaultValue) as T;
  }

  Future<void> _setValue<T>(dynamic key, T value) {
    logger.i("Cache => Setting $key to $value");
    return _box.put(key, value);
  }

  Future<void> clearCache() {
    return _box.clear();
  }
}
