import 'package:my_calendar_tg_bot_dart/domain/exception/domain_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/exception/repository_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';

abstract class UseCase {
  Future<Result<T, DomainException>> handleFailure<T>(Object object, StackTrace trace) async =>
    switch(object) {
      RepositoryException() => Failure(DomainException.fromRepository(object)),
      _ => Failure(DomainException(error: object, trace: trace))
    };

  Result<T, DomainException> handleResult<T>(Result<T, RepositoryException> result){
    return result.fold(
      onSuccess: (payload){
        return Success(payload);
      },
      onFailure: (obj){
        return Failure(obj.toDomain());
      }
    );
  }
}