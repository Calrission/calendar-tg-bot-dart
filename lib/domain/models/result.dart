sealed class Result<T, E> {
  const Result();

  bool get isSuccess => this is Success<T, E>;
  bool get isFailure => this is Failure<T, E>;

  T? get payloadOrNull => this is Success<T, E>
      ? (this as Success<T, E>).payload
      : null;
  
  Object? get exceptionOrNull => this is Failure<T, E>
      ? (this as Failure<T, E>).exception
      : null;

  R fold<R>({
    required R Function(T payload) onSuccess,
    required R Function(E exception) onFailure,
  }) {
    return switch (this) {
      Success(payload: final payload) => onSuccess(payload),
      Failure(exception: final exception) => onFailure(exception),
    };
  }
}

class Success<T, E> extends Result<T, E> {
  final T payload;
  const Success(this.payload);
}

class Failure<T, E> extends Result<T, E> {
  final E exception;
  const Failure(this.exception);
}