/*
"status": "OK",
"copyright": "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
"num_results": 20,
"results": [{}],
*/

class AppResponse {
  AppResponse({
    this.status,
    this.copyright,
    this.numResults,
    this.data,
  });

  String? status;
  String? copyright;
  int? numResults;
  dynamic data;

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        data: json["results"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": data,
      };
}
