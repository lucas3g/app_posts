import 'package:app_posts/app/core_module/services/client_http/client_http_interface.dart';
import 'package:app_posts/app/modules/posts/domain/value_object/posts_value_object.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts/posts_api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late PostsAPIDataSource postsAPIDataSource;
  late IClientHttp iClientHttp;

  setUp(() {
    iClientHttp = IClientHttpMock();
    postsAPIDataSource = PostsAPIDataSource(clientHttpInterface: iClientHttp);
  });

  test('should return a list of PostsEntity if status code is 200', () async {
    //arrege
    when(() => iClientHttp.get('/posts')).thenAnswer(
      (_) async => BaseResponse(
        [
          {
            'userId': 1,
            'id': 1,
            'title': 'title',
            'body': 'body',
          }
        ],
        BaseRequest(method: 'GET', url: 'url'),
      ),
    );

    //Act
    final result = await postsAPIDataSource.getPostsAPI();

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<List<PostsValueObject>>());
  });
}
