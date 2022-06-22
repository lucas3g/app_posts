import 'package:app_posts/app/core_module/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/client_http/client_http_interface.dart';
import 'services/client_http/dio_client_http.dart';

Bind<Dio> _dioFactory() {
  final baseOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: {'Content-Type': 'application/json'},
  );
  return Bind.factory((i) => Dio(baseOptions), export: true);
}

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    _dioFactory(),
    Bind.factory<IClientHttp>((i) => DioClientHttp(i()), export: true),
  ];
}
