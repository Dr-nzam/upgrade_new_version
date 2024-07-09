import 'package:get/get.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/data/secure_stokage.dart';
import 'package:upgrade_employ/network/authentification_service.dart';

class AuthentificationController extends GetxController{

  var loading = false.obs;
  final userModel = Get.put(UserModel());
  final AuthentificationService _provider = AuthentificationService();
  Future<Response> loginUserPost(String email, String password) async {
    print("tooto");
    final SecureStorage secureStorage = SecureStorage();
    
    loading.value = true;
    var response = await _provider.loginUser({
      'email': email,
      'password': password,
    });
    
      if (!response.status.hasError) {
        userModel.token.value = response.body;
        loading.value = false;
        await secureStorage.setToken(userModel.token['access']);
        // String? a = await secureStorage.getFirstInstall();
        print(response.statusCode);
        return response;
      } else {
        loading.value = false;
        return response;
      }
  }
  
  Future<Response> getInfoUser(String token) async {
    loading.value = true;
    var response = await _provider.infoUseGet(token);
    if (!response.status.hasError) {
      loading.value = false;
      if (response.statusCode == 200) {
        userModel.donnees.value = [response.body];
        loading.value = false;
        return response;
      }
    } else {
      loading.value = false;
      return response;
    }
      return response;
  }
}