import 'package:cometlabs/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 40,
            ),
            SizedBox(width: 15),
            const Text('News',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Container(
          color: Pallete.backgroundColor,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              Row(
                children:  [
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
              
            ],
            
          ),),
    );
  }
}
