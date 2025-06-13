import 'package:dotenv/dotenv.dart';

class Config {
  static const String _keyBotToken = "BOT_TOKEN";
    
  final Map<String, String> _config;

  String get botToken => _config[_keyBotToken]!;

  Config._(Map<String, String> config): _config = config;

  factory Config.fromEnvFile({String path = ".env"}){
    var env = DotEnv(includePlatformEnvironment: true)..load([path]);
    if (!env.isEveryDefined([_keyBotToken])){
      throw ArgumentError("config file $path not full filled");
    }
    return Config._({
      _keyBotToken: env[_keyBotToken]!
    });
  }
}