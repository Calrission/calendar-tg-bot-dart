import 'package:my_calendar_tg_bot_dart/domain/exception/data_source_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/event_model.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';

abstract class IEventDataSource {
  Future<Result<EventModel, DataSourceException>> create(CreateEventModel createEvent);
  Future<Result<EventModel, DataSourceException>> update(UpdateEventModel updateEvent);
  Future<Result<bool, DataSourceException>> delete(String id);
  Future<Result<List<EventModel>, DataSourceException>> readMany();
  Future<Result<EventModel, DataSourceException>> read(String id);
}
