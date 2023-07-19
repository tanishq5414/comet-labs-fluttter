import 'package:appinio_swiper/appinio_swiper.dart';
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
  Widget build(BuildContext context) {
    var newsTitle = 'Demand for new homes in the UK hits 14-year high';
    var publishedTime = 'Updated 2hrs ago';
    var source = 'The Guardian';
    var newsDescription =
        'Demand for new homes in the UK has hit a 14-year high, according to a survey, as the government’s stamp duty holiday and the shift to home working because of the pandemic continue to fuel the housing market boom.';
    var size = MediaQuery.of(context).size;
    return Container(
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      'For you',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Pallete.whiteColor),
                    ),
                    SizedBox(width: size.width * 0.05),
                    const Text(
                      'Top Stories',
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
                  child: Center(
                    child: Container(
                      height: size.height * 0.7,
                      width: size.width,
                      child: AppinioSwiper(
                          maxAngle: 50,
                          cardsBuilder: (BuildContext context, index) {
                            return Container(
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
                                      newsTitle,
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
                                        '$publishedTime.',
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
                                        source,
                                        style: TextStyle(
                                            color: Pallete.blackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.05),
                                    Text(
                                      newsDescription,
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
                            );
                          },
                          cardsCount: 10),
                    ),
                  ),
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
