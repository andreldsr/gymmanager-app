import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:prototipo_personalizacao/data/model/config.dart';

class ConfigHive {
  Future<void> updateProperty(
      {required String name, required String value}) async {
    final box = await _openBox();
    await box.put(name, value);
  }

  Future<void> updateConfig({required Config config}) async {
    final box = await _openBox();
    final json = jsonEncode(config.toJson());
    await box.put('config', json);
  }

  Future<Config?> getConfig() async {
    final box = await _openBox();
    final json = box.get('config');
    if (json != null) return Config.fromJson(jsonDecode(json));
    return null;
  }

  Future<String?> getProperty({required String name}) async {
    final box = await _openBox();
    return await box.get(name);
  }

  Future<Box<dynamic>> _openBox() async {
    var box = await Hive.openBox('config');
    return box;
  }
}
