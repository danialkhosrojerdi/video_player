import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/video_info_page.dart';

import 'colors.dart' as color;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Training',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: color.AppColor.homePageTitle,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_back_ios,
                      color: color.AppColor.homePageIcons,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: color.AppColor.homePageIcons,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: color.AppColor.homePageIcons,
                      size: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Your Program',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: color.AppColor.homePageSubtitle,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageDetail,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const VideoInfo()),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: color.AppColor.homePageIcons,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.AppColor.gradientFirst.withOpacity(0.8),
                          color.AppColor.gradientSecond.withOpacity(0.9)
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(70),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(5, 5),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        )
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next workout',
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Legs Toning',
                            style: TextStyle(
                                fontSize: 25,
                                color: color.AppColor.homePageContainerTextBig),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'and Glutes Workout',
                            style: TextStyle(
                                fontSize: 25,
                                color: color.AppColor.homePageContainerTextBig),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: color
                                        .AppColor.homePageContainerTextSmall,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '60 min',
                                    style: TextStyle(
                                        color: color.AppColor
                                            .homePageContainerTextSmall),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(4, 8),
                                          blurRadius: 10,
                                          color: color.AppColor.gradientFirst)
                                    ]),
                                child: Icon(
                                  Icons.play_circle_fill,
                                  size: 60,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 35),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/card.jpg'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(3, 8),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3),
                              blurRadius: 20,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 200, bottom: 30),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/figure.png'),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        margin: const EdgeInsets.only(left: 150, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You are doing great',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: color.AppColor.homePageDetail,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Keep it up\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.AppColor.homePagePlanColor,
                                ),
                                children: const [
                                  TextSpan(text: 'Stick to your plan'),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Area of focus',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('json/info.json'),
                      builder: (context, snapshot) {
                        var newData = json.decode(snapshot.data.toString());
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: newData == null ? 0 : newData.length,
                          itemBuilder: (_, i) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(newData[i]['img']),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: color.AppColor.gradientFirst
                                          .withOpacity(0.2),
                                      offset: const Offset(5, 5),
                                    ),
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: color.AppColor.gradientFirst
                                          .withOpacity(0.2),
                                      offset: const Offset(-5, -5),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(newData[i]['title']),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
