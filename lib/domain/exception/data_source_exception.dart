import 'package:my_calendar_tg_bot_dart/domain/exception/repository_exception.dart';

class DataSourceException implements Exception {
  final Object error;
  final StackTrace trace;

  DataSourceException({required this.error, required this.trace});

  RepositoryException toRepository() => RepositoryException(
    error: error, trace: trace
  );
}