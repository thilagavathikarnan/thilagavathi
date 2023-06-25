import 'dart:async';

import 'package:get_storage/get_storage.dart';

import '../model/user_model.dart';

class AuthSection
{
  UserModel? userModel;
  GetStorage _box = GetStorage();

  getLogin(data) async{
  _box.write('current_user', data);
  userModel = UserModel.fromJson(await _box.read('current_user'));
  _box.write('userLoggedIn', true);
  var userLoggedIn = _box.read('userLoggedIn');
  print("FETVALUE");
  print(userModel!.id);
  print(userModel!.name);
  print(userModel!.lastName);
  print(userLoggedIn);
  return true;
  }

  getLogout()
  {
    _box.remove('current_user');
    _box.write('userLoggedIn', false);
    var userLoggedIn = _box.read('userLoggedIn');
    print("FETVALUELOGOUT");
    print(userModel!.id);
    print(userModel!.name);
    print(userModel!.lastName);
    print(userLoggedIn);

  }

    getLoginStatus() async{
    var userLoggedIn = _box.read('userLoggedIn');
    print("CHECKLOGINSTATUS");
    print(userLoggedIn);
    if(userLoggedIn == null)
      {
        return false;

      }
    else
      {
        return userLoggedIn;

      }

  }
  isFirstTime() async{
    var isFirstTime = _box.read('first_time');
    print("FIRSTIMEFALSECHECK");
    print(isFirstTime);
    if (isFirstTime != null && !isFirstTime) {
      await _box.write('first_time', false);
      return false;
    } else {
      await _box.write('first_time', false);
      return true;
    }

  }


}