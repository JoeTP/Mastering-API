import 'package:api_mastering/models/user.dart';
import 'package:api_mastering/utils/constants.dart';
import 'package:api_mastering/web_services/web_services.dart';

class MyRepo {
  WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    return await webServices.getAllUsers();
  }

  Future<User> geUserById(int userId) async {
    return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser) async{
    return await webServices.createNewUser(newUser, "Bearer $TOKEN");
  }

  Future<dynamic> deleteUser(int userId) async{
    return await webServices.deleteUser(userId, "Bearer $TOKEN");
  }
}
