import 'package:televerse/televerse.dart';
import 'package:my_calendar_tg_bot_dart/bot/handlers.dart';

import 'config.dart';

void main() async {
  Config config = Config.fromEnvFile();
  Bot bot = Bot(config.botToken);
  bot.register(PingHandler());
  await bot.start();
}
