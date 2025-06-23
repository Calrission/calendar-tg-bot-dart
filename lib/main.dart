import 'package:my_calendar_tg_bot_dart/bot/features/events/events_handler.dart';
import 'package:televerse/televerse.dart';
import 'package:my_calendar_tg_bot_dart/bot/core/handlers.dart';

import 'config.dart';

void main() async {
  Config config = Config.fromEnvFile();
  Bot bot = Bot(config.botToken);
  bot.registerHandler(PingHandler());
  bot.registerHandler(EventsHandler());
  await bot.start();
}
