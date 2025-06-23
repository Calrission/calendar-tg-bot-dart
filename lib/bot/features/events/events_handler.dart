import 'dart:async';

import 'package:my_calendar_tg_bot_dart/bot/core/callbacks/registry_extension.dart';
import 'package:my_calendar_tg_bot_dart/bot/core/handlers/handler.dart';
import 'package:my_calendar_tg_bot_dart/bot/features/events/events_callback.dart';
import 'package:televerse/televerse.dart';

class EventsHandler extends CommandHandler {
  @override
  String get command => "events";

  @override
  FutureOr<void> handle(Context ctx) async {
    var keyboard = InlineKeyboard();
    for (final i in ["1", "2", "3"]){
      keyboard = keyboard.add(i, "test-$i");
      keyboard = keyboard.row();
    }
    await ctx.reply("Список событий: ", replyMarkup: keyboard);
  }

  @override
  void register(Bot<Context> bot) {
    super.register(bot);
    bot.registerCallback(EventsCallback());
  }
}