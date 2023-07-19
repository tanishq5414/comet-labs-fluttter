import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cometlabs/features/news/screens/news_details_page.dart';
import 'package:cometlabs/model/news_model.dart';
import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardComponent extends StatelessWidget {
  const NewsCardComponent({
    super.key,
    required this.size,
    required this.news,
  });

  final Size size;
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.7,
        width: size.width,
        child: AppinioSwiper(
          direction: AppinioSwiperDirection.right,
          swipeOptions: const AppinioSwipeOptions.symmetric(
            horizontal: true, vertical: false
          ),
          cardsCount: news.length,
          maxAngle: 50,
          cardsBuilder: (BuildContext context, index) {
            var parsedDate = DateTime.parse(news[index].publishedAt!);
            var pub =
                timeago.format(parsedDate, locale: 'en', allowFromNow: true);
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    NewsDetailsPage.route(
                        news[index],
                        [
                          Pallete.yellowColor,
                          Pallete.pinkColor,
                          Pallete.blueColor,
                          Pallete.purpleColor
                        ][index % 4]));
              },
              child: Container(
                width: size.width * 0.7,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: [
                    Pallete.yellowColor,
                    Pallete.pinkColor,
                    Pallete.blueColor,
                    Pallete.purpleColor
                  ][index % 4],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.05),
                  child: Column(
                    children: [
                      Text(
                        news[index].title ?? "No Title",
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          wordSpacing: 5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$pub.",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Published By',
                          style: TextStyle(
                              color: Pallete.darkGreyColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          news[index].source?.name ?? "No Source",
                          style: TextStyle(
                              color: Pallete.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Text(
                        news[index].description ?? "No Description",
                        style: TextStyle(
                            color: Pallete.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
