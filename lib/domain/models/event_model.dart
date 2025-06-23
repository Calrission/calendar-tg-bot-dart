abstract class Payload {}

class SingleEventPayload extends Payload {
  final DateTime date;

  SingleEventPayload({required this.date});
}

class BaseEventModel {
  final String name;
  final String description;
  final Payload payload;

  BaseEventModel({
    required this.name,
    required this.description,
    required this.payload
  });

  EventModel toEventModel(String id) => EventModel(
    id: id, name: name,
    description: description,
    payload: payload
  );
}

typedef CreateEventModel = BaseEventModel;

class EventModel extends BaseEventModel {
  final String id;

  EventModel({
    required this.id,
    required super.name,
    required super.description,
    required super.payload
  });
}

typedef UpdateEventModel = EventModel;
