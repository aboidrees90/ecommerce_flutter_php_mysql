import 'package:ecommerce_php/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCache {
  // save user-info
  static Future<void> save(User userInfo) async {
    SharedPreferences userCache = await SharedPreferences.getInstance();

    await userCache.setString("userInfo", userInfo.toJson());
  }

  // read user-info
  static Future<User?> read() async {
    SharedPreferences userCache = await SharedPreferences.getInstance();

    String? currentUserInfo = userCache.getString('userInfo');

    return (currentUserInfo != null) ? User.fromJson(currentUserInfo) : null;
  }

  // remove user-info
  static Future<bool> remove() async {
    SharedPreferences userCache = await SharedPreferences.getInstance();
    return await userCache.remove('userInfo');
  }
}
