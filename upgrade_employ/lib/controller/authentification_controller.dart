import 'package:get/get.dart';
import 'package:upgrade_employ/data/model.dart';
import 'package:upgrade_employ/data/secure_stokage.dart';
import 'package:upgrade_employ/network/authentification_service.dart';

class AuthentificationController extends GetxController {
  var loading = false.obs;
  final userModel = Get.put(UserModel());
  String messageObs = ''.obs.value;
  final AuthentificationService _provider = AuthentificationService();
  Future<Response> loginUserPost(String email, String password) async {
    final SecureStorage secureStorage = SecureStorage();

    loading.value = true;
    var response = await _provider.loginUser({
      'email': email,
      'password': password,
    });


    if (!response.status.hasError) {
      userModel.token.value = {"token":response.body['access']};
      await secureStorage.setToken(userModel.token['token']);
      var infoUser = await _provider.infoUseGet(userModel.token['token']);
      if (infoUser.statusCode == 200) {
        userModel.donnees.value = [infoUser.body];
        loading.value = false;
      }
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

  Future<Response> changerpassword(
      String oldPassword, String newPassword, String token) async {
    loading.value = true;
    var response = await _provider.changepasswordPut(
      {
        "old_password": oldPassword,
        "new_password": newPassword,
      },
      token,
    );
    if (response.statusCode != null) {
      if (!response.status.hasError) {
        // messageObs = response.body["message"];
        print(response.body);
        loading.value = false;
        return response;
      } else {
        print("**-**-*-*--**-*-*");
        print(response.body);
        messageObs = response.body["old_password"][0];
        loading.value = false;
        return response;
      }
    } else {
      messageObs = "Erreur de connexion au server*";
      loading.value = false;
      return response;
    }
  }


    Future<Response> ajouterUtisateur(
      String nom,
      String dateDebut,
      String dateFin,
      String heureDebut,
      String heureFin,
      int departement,
      String token) async {
    loading.value = true;
    var response = await _provider.ajouterUserPost(
      {
        'nom': nom,
        'dateDebut': dateDebut,
        'dateFin': dateFin,
        'heureDebut': heureDebut,
        'heureFin': heureFin,
        'departement': departement
      },
      token,
    );
    if (response.statusCode != null) {
      if (!response.status.hasError) {
        messageObs = response.body["message"];
        loading.value = false;
        return response;
      } else {
        messageObs = response.body["message"];
        loading.value = false;
        return response;
      }
    } else {
      messageObs = "Erreur de connexion au server*";
      loading.value = false;
      return response;
    }
  }
}
