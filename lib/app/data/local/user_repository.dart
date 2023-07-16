import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  UserRepository(this.prefs);

  static const key = 'ballabash_level';

  final SharedPreferences prefs;

  int getCurrentLevel(int levelsCount) {
    final data = prefs.getInt(key);

    if (data != null) {
      if (data <= levelsCount) {
        return data;
      } else {
        return levelsCount;
      }
    }
    return 1;
  }

  Future<bool> setLevel(int number) {
    return prefs.setInt(key, number);
  }
}
