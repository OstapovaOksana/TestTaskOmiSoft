/// Api requests handling.
///
/// Contains [data] result if api request was successful.
/// Contains [error] result if api request failed.
class ApiResult<T> {
  /// returns from successful request
  T? data;

  /// returns from failed request
  ApiError error;

  ApiResult({this.data, this.error = ApiError.NONE});
}

/// Contains api errors that can appear
enum ApiError {
  NONE,
  NO_NETWORK,
  SERVER_REQUEST_FAILED,
}
