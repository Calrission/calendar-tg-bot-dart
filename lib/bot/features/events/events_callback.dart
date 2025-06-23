import 'package:my_calendar_tg_bot_dart/bot/core/callbacks/callback.dart';
import 'package:televerse/telegram.dart';
import 'package:televerse/televerse.dart';

class EventsCallback extends CallbackWithData<int> {
  @override
  bool isValidData(String data) {
    final parts = data.split("-");
    if (parts.length != 2){
      return false;
    }
    if (parts[0] != "test"){
      return false;
    }
    final index = parts.last;
    return int.tryParse(index) != null;
  }

  @override
  int parser(String data) {
    final parts = data.split("-");
    return int.parse(parts[1]);
  }

  @override
  Future<void> callbackData(Context ctx, int data, CallbackQuery query) async {
    print("event - $data");
  }
}