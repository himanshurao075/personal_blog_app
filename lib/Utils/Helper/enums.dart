enum RequestType {
  GET,
  POST,
  DELETE,
  PUT,
  PATCH}

enum ExceptionType {
  TIMEOUT_EXCEPTION,
  SOCKET_EXCEPTION,
  API_EXCEPTION,
  PARSE_EXCEPTION,
  NO_EXCEPTION }

class ResponseType {
  static const String SUCCESS = "success";
  static const String FAILED = "failed";
}