import 'dart:convert' as json;
import 'dart:io';

import 'package:get/get.dart';
import 'package:ny_times/global_models/app_response.dart';

class CustomHttpClient extends GetConnect {
  static CustomHttpClient get instance {
    late CustomHttpClient client;
    try {
      client = Get.find();
    } catch (_) {
      client = Get.put(CustomHttpClient());
    }
    return client;
  }

  @override
  void onInit() {
    super.onInit();

    baseUrl = 'https://api.nytimes.com/';
  }

  Future<Response?> getData(
    String url, {
    Map<String, dynamic>? queryParameters,
    Function(AppResponse? appResponse)? onSuccess,
    Function(AppResponse? appResponse)? onError,
  }) async {
    Response? response = await get(
      url.replaceAll(baseUrl ?? '', ''),
      query: queryParameters,
    );

    AppResponse appResponse =
        AppResponse.fromJson(json.jsonDecode(response.bodyString ?? ''));

    if (response.statusCode == HttpStatus.ok && appResponse.status == 'OK') {
      await onSuccess?.call(appResponse);
    } else {
      await onError?.call(appResponse);
    }

    return response;
  }
}
