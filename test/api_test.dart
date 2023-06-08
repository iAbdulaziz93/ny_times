import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times/articles/list/controller.dart';
import 'package:ny_times/articles/model.dart';

@GenerateMocks([ArticlesController])
void main() {
  ArticlesController? controller;

  setUp(() {
    try {
      controller = Get.find();
    } catch (_) {
      controller = Get.put(ArticlesController());
    }
  });

  group('Test NY Times APIs', () {
    test('Test Most Popular API call', () async {
      when(controller?.getArticles())
          .thenAnswer((_) => <MostPopularArticles>[]);
    });

    //expect(controller?.getArticles(), <MostPopularArticles>[]);
  });
}
