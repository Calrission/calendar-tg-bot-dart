import 'package:my_calendar_tg_bot_dart/config.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  test("Config load", (){
    Config config = Config.fromEnvFile(path: "test/mock/test.env");
    expect(config.botToken, "BOT_TOKEN");
  });

  test("Error not exist env file", (){
    try{
      Config.fromEnvFile(path: "not_exist.env");
      expect(false, true);
    } on ArgumentError catch(_){
      expect(true, true);
    }
  });

  test("Error not full filed env file", (){
    try{
      Config.fromEnvFile(path: "test/mock/not_full_filled.env");
      expect(false, true);
    } on ArgumentError catch(_){
      expect(true, true);
    }
  });
}