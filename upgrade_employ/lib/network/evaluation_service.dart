import 'package:get/get.dart';
import 'package:upgrade_employ/component/constante.dart';

class EvaluationServiceProvider extends GetxController {
  final GetConnect getConnect = GetConnect();
  Future<Response> ajouterEvaluationPost(
      Map<String, dynamic> data, String token) async {
    final response = await getConnect.post(
        '${Constante.apiPath}evaluation/create-evaluation/',
        headers: {
          'Authorization': 'Token $token',
        },
        data);
        print(response.body);
    return response;
  }

  Future<Response> evaluationFutureGet(String token) async {
    final response = await getConnect.get(
        '${Constante.apiPath}evaluation/liste-evaluation-future/',
        headers: {
          'Authorization': 'Token $token',
        });
    return response;
  }

  Future<Response> statistiqueGet(String token) async {
    final response = await getConnect.get(
        '${Constante.apiPath}evaluation/statistique-evaluation/',
        headers: {
          'Authorization': 'Token $token',
        });
    return response;
  }

  Future<Response> historiqueGet(String token) async {
    final response = await getConnect.get(
        '${Constante.apiPath}evaluation/liste-evaluation-passe/',
        headers: {
          'Authorization': 'Token $token',
        });
    return response;
  }

  Future<Response> listeDepartementGet(String token) async {
    final response = await getConnect
        .get('${Constante.apiPath}evaluation/list-departement/', headers: {
      'Authorization': 'Token $token',
    });
    return response;
  }
}
