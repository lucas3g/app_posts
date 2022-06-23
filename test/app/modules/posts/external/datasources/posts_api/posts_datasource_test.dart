import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts_api/posts_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late IClientHttp clientHttp;
  late PostsAPIDataSource postsAPIDataSource;

  setUp(() {
    clientHttp = ClientHttpmock();
    postsAPIDataSource = PostsAPIDataSource(clientHttpInterface: clientHttp);
  });

  test('should be return list of dynamic', () async {
    when(() => clientHttp.get('/posts')).thenAnswer(
      (_) async => BaseResponse(
        [{}],
        BaseRequest(url: '/posts', method: 'GET'),
      ),
    );

    final result = await postsAPIDataSource.getPostsAPI();

    expect(result, isA<List<dynamic>>());
  });
}
