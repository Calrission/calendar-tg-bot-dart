import 'package:my_calendar_tg_bot_dart/domain/data_source/mock_event_data_source.dart';
import 'package:my_calendar_tg_bot_dart/domain/repository/mock_event_repository.dart';
import 'package:my_calendar_tg_bot_dart/domain/exception/domain_exception.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/result.dart';
import 'package:my_calendar_tg_bot_dart/domain/usecase/event_use_case.dart';
import 'package:my_calendar_tg_bot_dart/domain/models/event_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  group("Event Use Case Test", (){

    late MockEventDataSource dataSource;
    late EventUseCase useCase;

    setUp((){
      dataSource = MockEventDataSource();
      useCase = EventUseCase(repository: MockEventRepository(
        dataSource: dataSource
      ));
    });

    test("add new event", () async {
      Result<EventModel, DomainException> result = await useCase.addNewEvent(CreateEventModel(
        name: 'Test',
        description: 'Test',
        payload: SingleEventPayload(date: DateTime.now())
      ));
      result.fold(
        onSuccess: (payload){
          expect(payload, dataSource.data.values.last);
        },
        onFailure: (obj){
          print(obj);
          expect(true, false);
        }
      );
    });
  });

}