import 'package:my_calendar_tg_bot_dart/domain/exception/domain_exception.dart';

class RepositoryException implements Exception {
  final Object error;
  final StackTrace trace;

  RepositoryException({required this.error, required this.trace});

  DomainException toDomain() => DomainException(error: error, trace: trace);
}