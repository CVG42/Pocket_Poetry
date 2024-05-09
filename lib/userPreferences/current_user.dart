import 'package:get/get.dart';
import 'package:zap653/models/user.dart';
import 'package:zap653/userPreferences/user_preferences.dart';

class CurrentUser extends GetxController{
  Rx<User> _currenUser = User(0, '', '', '').obs;

  User get user => _currenUser.value;

  getUserInfo() async{
    User? getUserInfoFromLocalStorage = await RememberUserPrefs.readUser();
    _currenUser.value = getUserInfoFromLocalStorage!;
  }
}