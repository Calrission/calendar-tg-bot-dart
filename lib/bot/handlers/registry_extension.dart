import 'package:televerse/televerse.dart' hide Handler;
import 'handler.dart';

extension HandlerRegister on Bot {
  void register(Handler handler){
    handler.register(this);
  }
}