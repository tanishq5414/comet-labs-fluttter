import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cometlabs/features/news/components/news_card_component.dart';
import 'package:cometlabs/features/news/controller/newscontroller.dart';
import 'package:cometlabs/model/news_model.dart';
import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  void initState() {
    ref.read(newsControllerProvider.notifier).fetchNews(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = ref.watch(newsControllerProvider);
    var news = ref.watch(newsDataProvider) ?? [];
    print(news);
    var newsTitle = 'Demand for new homes in the UK hits 14-year high';
    var publishedTime = 'Updated 2hrs ago';
    var source = 'The Guardian';
    var newsDescription =
        'Demand for new homes in the UK has hit a 14-year high, according to a survey, as the government’s stamp duty holiday and the shift to home working because of the pandemic continue to fuel the housing market boom.';
    var size = MediaQuery.of(context).size;
    return (isLoading)
        ? CircularProgressIndicator()
        : Container(
            color: Pallete.backgroundColor,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 40,
                      ),
                      SizedBox(width: 15),
                      const Text('News',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                body: Container(
                  color: Pallete.backgroundColor,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.07),
                          const Text(
                            'Top stories',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                color: Pallete.whiteColor),
                          ),
                          SizedBox(width: size.width * 0.05),
                          const Text(
                            'For you',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Pallete.lightGreyColor),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: NewsCardComponent(size: size, news: news),
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

