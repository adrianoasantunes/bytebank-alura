import 'package:http/http.dart';
import 'package:bytebank/http/interceptors/logging_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';

/*final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);*/

Client client = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
);

const String baseUrl = 'http://192.168.0.208:8080/transactions';
