import 'package:televerse/televerse.dart';
import 'handler.dart';

class PingHandler extends CommandHandler {
  @override
  String get command => "ping";

  @override
  Future<void> handle(Context ctx) async {
    await ctx.reply("pong");
  }
}