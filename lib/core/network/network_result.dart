sealed class NetworkResult<T> {}

class NetworkSuccess<T> extends NetworkResult<T> {
  final T data;
  NetworkSuccess(this.data);
}

class NetworkError<T> extends NetworkResult<T> {
  final String message;
  NetworkError(this.message);
}
