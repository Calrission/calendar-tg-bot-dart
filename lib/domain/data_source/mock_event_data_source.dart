import 'package:my_calendar_tg_bot_dart/domain/data_source/event_data_source.dart';
import 'package:my_calendar_tg_bot_dart/domain/exception/data_source_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/event_model.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';

class MockEventDataSource extends IEventDataSource {
  final Map<String, EventModel> data = {};

  @override
  Future<Result<EventModel, DataSourceException>> create(CreateEventModel createEvent) async {
    final key = data.length.toString();
    final created = createEvent.toEventModel(key);
    data[key] = created;
    return Success(created);
  }

  @override
  Future<Result<bool, DataSourceException>>  delete(String id) async {
    data.remove(id);
    return Success(true);
  }

  @override
  Future<Result<List<EventModel>, DataSourceException>> readMany() async {
    return Success(data.values.toList());
  }

  @override
  Future<Result<EventModel, DataSourceException>> update(UpdateEventModel updateEvent) async {
    data[updateEvent.id] = updateEvent;
    return Success(updateEvent);
  }

  @override
  Future<Result<EventModel, DataSourceException>> read(String id) async {
    final event = data[id]!;
    return Success(event);
  }
}