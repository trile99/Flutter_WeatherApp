import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  LocalStorageServices(this._prefs);

  final SharedPreferences _prefs;

  Future<void> setCityNameList(List<String> cityNameList) async {
    _prefs.setStringList('cityNameList', cityNameList);
  }

  List<String> get cityNameList => _prefs.getStringList('cityNameList') ?? [];
}
