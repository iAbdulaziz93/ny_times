import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times/articles/details/view.dart';
import 'package:ny_times/articles/list/controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return GetBuilder(
          init: ArticlesController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('NY Times Most Popular Articles'),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                actions: const [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.more_vert),
                  ),
                ],
                backgroundColor: Colors.cyan,
              ),
              body: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => Get.to(ArticlesDetails(
                          selectedArticle: controller.articles?[index],
                        )),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: controller.articles == null
                              ? null
                              : Image.network(controller
                                          .articles?[index]
                                          .media
                                          ?.firstOrNull
                                          ?.mediaMetadata?[1]
                                          .url ??
                                      'https://static01.nyt.com/vi-assets/images/share/1200x1200_t.png')
                                  .image,
                        ),
                        title: Text(
                          '${controller.articles?[index].title}',
                          maxLines: 2,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          '${controller.articles?[index].abstract}',
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: controller.articles?.length ?? 0,
                  ),
                ),
              ),
            );
          });
    });
  }
}
