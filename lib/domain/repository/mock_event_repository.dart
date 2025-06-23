import 'package:my_calendar_tg_bot_dart/domain/data_source/event_data_source.dart';
import 'package:my_calendar_tg_bot_dart/domain/exception/repository_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/repository/abstract_event_repository.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/event_model.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';

class MockEventRepository extends IEventRepository {
  final IEventDataSource _dataSource;

  MockEventRepository({required IEventDataSource dataSource}):
    _dataSource = dataSource;

  @override
  Future<Result<EventModel, RepositoryException>> create(CreateEventModel createEvent) async {
    try {
      final result = await _dataSource.create(createEvent);
      return result.fold(
        onSuccess: (payload){
          return Success(payload);
        },
        onFailure: (obj){
          return Failure(obj.toRepository());
        }
      );
    } catch(e, trace){
      return handleException(e, trace);
    }
  }

  @override
  Future<Result<bool, RepositoryException>> delete(String id) async {
    try {
      final result = await _dataSource.delete(id);
      return handleResult(result);
    } catch(e, trace){
      return handleException(e, trace);
    }
  }

  @override
  Future<Result<EventModel, RepositoryException>> read(String id) async {
    try {
      final result = await _dataSource.read(id);
      return handleResult(result);
    } catch(e, trace){
      return handleException(e, trace);
    }
  }

  @override
  Future<Result<List<EventModel>, RepositoryException>> readMany() async {
    try {
      final result = await _dataSource.readMany();
      return handleResult(result);
    } catch(e, trace){
      return handleException(e, trace);
    }
  }

  @override
  Future<Result<EventModel, RepositoryException>> update(UpdateEventModel updateEvent) async {
    try {
      final result = await _dataSource.update(updateEvent);
      return handleResult(result);
    } catch(e, trace){
      return handleException(e, trace);
    }
  }
}