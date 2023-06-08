import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ny_times/articles/model.dart';
import 'package:ny_times/helpers/custom_http_client.dart';
import 'package:ny_times/utils/constants.dart';

class ArticlesController extends GetxController {
  List<MostPopularArticles>? articles;

  @override
  void onInit() {
    super.onInit();

    getArticles();
  }

  void getArticles({
    String? section = 'all-sections',
    int? numberOfDays = 7,
  }) async {
    EasyLoading.show();

    await CustomHttpClient.instance.getData(
        'svc/mostpopular/v2/mostviewed/$section/$numberOfDays.json',
        queryParameters: {
          'api-key': Constants.apiKey,
        }, onSuccess: (appResponse) {
      articles = List.generate(appResponse?.numResults ?? 0,
          (index) => MostPopularArticles.fromJson(appResponse?.data?[index]));
      log('${appResponse?.data}');
      EasyLoading.dismiss();
      update();
    }, onError: (appResponse) {
      articles = [];
      log('${appResponse?.data}');
      EasyLoading.dismiss();
      update();
    });
  }
}
