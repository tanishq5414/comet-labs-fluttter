import 'package:cometlabs/model/news_model.dart';
import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

//create a route

class NewsDetailsPage extends ConsumerStatefulWidget {
  static Route route(NewsModel news, Color color) {
    return MaterialPageRoute<void>(
        builder: (_) => NewsDetailsPage(news: news, color: color));
  }

  NewsModel news;
  Color color;
  NewsDetailsPage({super.key, required this.news, required this.color});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NewsDetailsPageState();
}

class NewsDetailsPageState extends ConsumerState<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var news = widget.news;
    var size = MediaQuery.of(context).size;
    var parsedDate = DateTime.parse(news.publishedAt!);
    var pub = timeago.format(parsedDate, locale: 'en', allowFromNow: true);
    return Container(
      color: widget.color,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.06,
                  right: size.width * 0.06),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Pallete.blackColor.withOpacity(0.2),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            weight: 30,
                          ),
                          color: Pallete.blackColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    news.title ?? "No Title",
                    style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          wordSpacing: 5,
                        ),
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
                  Row(
                    children: [
                      Text(
                        'Published By',
                        style: TextStyle(
                            color: Pallete.darkGreyColor,
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      news.source?.name ?? "No Source",
                      style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    news.description ?? "No Description",
                    style: TextStyle(
                        color: Pallete.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(news.urlToImage ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(news.url ?? ""),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: size.width * 0.3,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Pallete.blackColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Link',
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
