import 'package:hive_flutter/hive_flutter.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';

class HiveService {
  static const String userBoxName = 'user_box';
  static const String userListKey = 'user_list';

  // Initialize Hive and open box
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDetailsEntityAdapter());
    await Hive.openBox<List>(userBoxName);
  }

  // Save or update user list
  static Future<void> saveUserList(
      List<UserDetailsEntity> users, bool isNew) async {
    List<UserDetailsEntity> list = [];
    final box = Hive.box<List>(userBoxName);
    if (!isNew) {
      list = getUserList();
    } else {
      await box.delete(userListKey);
    }

    list.addAll(users);
    await box.put(userListKey, list);
  }

  // Get saved user list
  static List<UserDetailsEntity> getUserList() {
    final box = Hive.box<List>(userBoxName);
    final List? userList = box.get(userListKey);
    if (userList != null) {
      return userList.cast<UserDetailsEntity>();
    }
    return [];
  }

  // Clear all data
  static Future<void> clearAll() async {
    final box = Hive.box<List>(userBoxName);
    await box.clear();
  }
}
