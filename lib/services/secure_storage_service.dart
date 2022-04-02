import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_budget_app/models/secured_item_model.dart';

class SecureStorage
{
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> write(String key, String value) async
  {
    if (key.isEmpty || value.isEmpty) {
      return;
    }

    await storage.write(key: key, value: value);
  }

  Future<SecuredItem?> get(String key) async
  {
    String? value =  await storage.read(key: key);

    if (value == null || value.isEmpty) {
      return null;
    }

    return SecuredItem(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}