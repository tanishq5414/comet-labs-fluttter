import 'package:cometlabs/features/news/controller/newscontroller.dart';
import 'package:cometlabs/features/news/screens/news_details_page.dart';
import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchViewWidget extends ConsumerStatefulWidget {
  const SearchViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchViewWidgetState();
}

class _SearchViewWidgetState extends ConsumerState<SearchViewWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var news =
        ref.watch(searchDataProvider) ?? ref.watch(newsDataProvider) ?? [];
    var searchcontroller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 15),
            Text(
              'Search',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        // search bar
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchcontroller,
                onSubmitted: (value) {
                  ref
                      .read(newsControllerProvider.notifier)
                      .searchNews(context, value);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.75,
            child: ListView.builder(
                itemCount: news.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var parsedDate = DateTime.parse(news[index].publishedAt!);
                  var pub = timeago.format(parsedDate,
                      locale: 'en', allowFromNow: true);
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                        vertical: size.height * 0.01),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            NewsDetailsPage.route(news[index], [
                              Pallete.yellowColor,
                              Pallete.pinkColor,
                              Pallete.blueColor,
                              Pallete.purpleColor
                            ][index % 4]));
                      },
                      child: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: [
                              Pallete.yellowColor,
                              Pallete.pinkColor,
                              Pallete.blueColor,
                              Pallete.purpleColor
                            ][index % 4],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          SizedBox(height: size.width * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.02),
                              child: Text(pub,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.05,
                                top: size.height * 0.02,
                                right: size.width * 0.05,
                                bottom: size.height * 0.01),
                            child: Text(news[index].title ?? "No Title",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: size.width * 0.002),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.02),
                            child: Text(
                                news[index].description ?? "No Description",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: size.width * 0.002),
                        ]),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
