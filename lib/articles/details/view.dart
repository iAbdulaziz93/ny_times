import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times/articles/model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArticlesDetails extends StatelessWidget {
  const ArticlesDetails({
    super.key,
    required this.selectedArticle,
  });

  final MostPopularArticles? selectedArticle;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${selectedArticle?.title}'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.cyan,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    Image(
                      width: Get.width,
                      height: 293,
                      image: Image.network(selectedArticle?.media?.firstOrNull
                                  ?.mediaMetadata?.last.url ??
                              'https://static01.nyt.com/vi-assets/images/share/1200x1200_t.png')
                          .image,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${selectedArticle?.title}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${selectedArticle?.byline}',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${selectedArticle?.publishedDate}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '${selectedArticle?.abstract}',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
