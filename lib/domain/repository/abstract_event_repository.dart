import 'package:my_calendar_tg_bot_dart/domain/exception/data_source_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/exception/repository_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/event_model.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';

abstract class IEventRepository {
  Future<Result<EventModel, RepositoryException>> create(CreateEventModel createEvent);
  Future<Result<EventModel, RepositoryException>> update(UpdateEventModel updateEvent);
  Future<Result<bool, RepositoryException>> delete(String id);
  Future<Result<List<EventModel>, RepositoryException>> readMany();
  Future<Result<EventModel, RepositoryException>> read(String id);

  Failure<T, RepositoryException> handleException<T>(Object object, StackTrace trace){
    return switch(object){
      DataSourceException() => Failure(object.toRepository()),
      _ => Failure(RepositoryException(error: object, trace: trace))
    };
  }

  Result<T, RepositoryException> handleResult<T>(Result<T, DataSourceException> result){
    return result.fold(
      onSuccess: (payload){
        return Success(payload);
      },
      onFailure: (obj){
        return Failure(obj.toRepository());
      }
    );
  }
}