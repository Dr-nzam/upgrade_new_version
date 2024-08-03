import 'package:get/get.dart';
import 'package:upgrade_employ/component/constante.dart';

class AuthentificationService extends GetxController {
  final GetConnect getConnect = GetConnect();
  Future<Response> loginUser(Map<String, dynamic> data) async {
    final response =
        await getConnect.post("${Constante.apiPath}account/login/", data);
    print("${Constante.apiPath}account/login/");
    print(data);
    // print(response);
    return response;
  }

  Future<Response> infoUseGet(String token) async {
    final response = await getConnect
        .get('${Constante.apiPath}account/info-user/', headers: {
      'Authorization': 'Token $token',
    });
    return response;
  }

  Future<Response> changepasswordPut(
      Map<String, dynamic> data, String token) async {
    final response = await getConnect.put(
        '${Constante.apiPath}account/change-password/',
        headers: {
          'Authorization': 'Token $token',
        },
        data);
    return response;
  }

  Future<Response> ajouterUserPost(
      Map<String, dynamic> data, String token) async {
    final response = await getConnect.post(
        '${Constante.apiPath}account/create-user/',
        headers: {
          'Authorization': 'Token $token',
        },
        data);
    return response;
  }

  Future<Response> listeUseGet(String token) async {
    final response = await getConnect
        .get('${Constante.apiPath}account/liste-users/', headers: {
      'Authorization': 'Token $token',
    });
    return response;
  }
}
