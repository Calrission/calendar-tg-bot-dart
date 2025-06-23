import 'package:my_calendar_tg_bot_dart/bot/core/handlers/handler.dart';
import 'package:televerse/televerse.dart';

class PingHandler extends CommandHandler {
  @override
  String get command => "ping";

  @override
  Future<void> handle(Context ctx) async {
    await ctx.reply("pong");
  }
}