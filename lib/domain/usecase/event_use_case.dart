import 'package:my_calendar_tg_bot_dart/domain/exception/domain_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/event_model.dart';
import 'package:my_calendar_tg_bot_dart/domain/repository/event_repository.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';
import 'package:my_calendar_tg_bot_dart/domain/usecase/usecase.dart';

class EventUseCase extends UseCase {
  final IEventRepository _repository;

  EventUseCase({
    required IEventRepository repository
  }): _repository = repository;

  Future<Result<EventModel, DomainException>> addNewEvent(CreateEventModel createEventModel) async {
    try {
      final result = await _repository.create(createEventModel);
      return handleResult(result);
    } catch(e, trace) {
      return handleFailure(e, trace);
    }
  }
}