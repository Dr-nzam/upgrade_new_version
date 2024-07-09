import 'package:get/get.dart';
import 'package:upgrade_employ/component/constante.dart';

class AuthentificationService extends GetxController {

  final GetConnect getConnect = GetConnect();
   Future<Response> loginUser(Map<String, dynamic> data) async {
      final response = await getConnect.post('${Constante.apiPath}account/login/', data);
      return response;
  }


  Future<Response> infoUseGet(String token) async {
    final response =
        await getConnect.get('${Constante.apiPath}account/info-user/', headers: {
      'Authorization': 'Token $token',
    });
    return response;
  }
  }