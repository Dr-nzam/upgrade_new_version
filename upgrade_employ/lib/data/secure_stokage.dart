
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Creatiion du stockage
  final storage = const FlutterSecureStorage();
  
  final String _keyToken = 'token';
  final String _keyFirstInstall = "true";
  
  Future setToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  Future<String?> getToken() async {
    String? token = await storage.read(key: _keyToken);
    return token ?? '';
  }

Future setFirstInstall(String firstInstall) async {
    await storage.write(key: _keyFirstInstall, value: firstInstall);
  }

  Future<String?> getFirstInstall() async {
    String? firstInstall = await storage.read(key: _keyFirstInstall);
    return firstInstall ?? 'true';
  }
}
