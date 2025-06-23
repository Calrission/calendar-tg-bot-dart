import 'package:my_calendar_tg_bot_dart/domain/exception/repository_exception.dart';

class DomainException implements Exception {
  final Object error;
  final StackTrace trace;

  DomainException({required this.error, required this.trace});

  factory DomainException.fromRepository(RepositoryException exception) =>
      DomainException(error: exception.error, trace: exception.trace);
}