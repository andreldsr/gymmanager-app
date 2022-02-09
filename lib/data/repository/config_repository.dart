import 'package:dio/dio.dart';
import 'package:prototipo_personalizacao/data/model/config.dart';
import 'package:prototipo_personalizacao/data/shared/config_hive.dart';

class ConfigRepository {
  ConfigRepository({required this.configHive});

  ConfigHive configHive;
  final Dio _dio = Dio();

  Future<Config> loadNewConfig() async {
    final data = await _dio
        .get("https://gymmanagerandreldsr.herokuapp.com/configuration/full");
    return Config.fromJson(data.data);
  }

  Future<void> updateLocalConfig(Config config) async {
    configHive.updateConfig(config: config);
  }

  Future<String?> getProperty(String property) async {
    return await configHive.getProperty(name: property);
  }

  Future<Config?> getConfig() async {
    return await configHive.getConfig();
  }
}
